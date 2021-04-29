# vim:ts=4:sts=4:sw=4:expandtab

import collections
import datetime
import io
import itertools
import pathlib
import requests
import ssl
import thriftpy2
import thriftpy2.rpc
import urllib.parse
import yaml

from kolejka.judge.ctxyaml import ctxyaml_dump

class File:
    def __init__(self, name, filename, value, output_dir=None):
        self.name = name
        self.filename = filename
        self.value = value
        self.output_dir = pathlib.Path(output_dir or '.')

    @property
    def output_path(self):
        return self.output_dir / self.name / self.filename

    def dump(self):
        output = self.output_path
        output.parent.mkdir(parents=True, exist_ok=True)
        val = self.value
        if isinstance(val, str):
            val = bytes(val, 'utf8')
        output.write_bytes(val)
        return output.relative_to(self.output_dir)

class Blob:
    def __init__(self, model, id, group, name, filename, hash, hostname='satori.tcs.uj.edu.pl', blob_port=2887, ssl=True, token='', output_dir=None):
        self.model = model
        self.id = id
        self.group = group
        self.name = name
        self.filename = filename
        self.hash = hash
        self.hostname = hostname
        self.blob_port = blob_port
        self.ssl = ssl
        self.token = token
        self.output_dir = pathlib.Path(output_dir or '.')

    @property
    def url(self):
        scheme = self.ssl and 'https' or 'http'
        location = self.hostname + ':' + str(self.blob_port)
        path = '/blob/' + '/'.join([ urllib.parse.quote(str(f)) for f in [self.model, self.id, self.group, self.name] ])
        return urllib.parse.urlunparse((scheme, location, path, '', '', ''))

    @property
    def request(self):
        cookies = dict([
            ('satori_token', self.token),
        ])
        return requests.get(self.url, cookies=cookies)

    @property
    def output_path(self):
        return self.output_dir / 'blobs' / (self.model + '_' + str(self.id)) / (self.group + '_' + self.name) / self.filename

    def dump(self):
        output = self.output_path
        output.parent.mkdir(parents=True, exist_ok=True)
        #TODO: cache + hash check
        if not output.exists():
            output.write_bytes(self.request.content)
        return output.relative_to(self.output_dir)

class OAMap:
    def __init__(self, model, id, group, map, hostname='satori.tcs.uj.edu.pl', blob_port=2887, ssl=True, token='', output_dir=None):
        self.model = model
        self.id = id
        self.group = group
        self.map = map
        self.hostname = hostname
        self.blob_port = blob_port
        self.ssl = ssl
        self.token = token
        self.output_dir = output_dir

    def dump(self):
        result = dict()
        for key, value in self.map.items():
            if value.is_blob:
                blob = Blob(self.model, self.id, self.group, value.name, value.filename, value.value, hostname=self.hostname, blob_port=self.blob_port, ssl=self.ssl, token=self.token, output_dir=self.output_dir)
                result[key] = blob.dump()
            else:
                result[key] = value.value
        return result

class SatoriDumper:

    BOOTSTRAP_THRIFT = 'service Server { string Server_getIDL(1:string token) }'

    def __init__(self, username, password, hostname='satori.tcs.uj.edu.pl', thrift_port=2889, blob_port=2887, ssl=True, output_dir=None):
        self.username = str(username)
        self.password = str(password)
        self.hostname = str(hostname)
        self.thrift_port = int(thrift_port)
        self.blob_port = int(blob_port)
        self.ssl = bool(ssl)
        self.satori_thrift = None
        self.clients = dict()
        self.token = ''
        self.output_dir = output_dir

    def make_client(self, service):
        return thriftpy2.rpc.make_client(
            service,
            self.hostname, self.thrift_port,
            trans_factory=thriftpy2.transport.TFramedTransportFactory(),
            proto_factory=thriftpy2.protocol.TBinaryProtocolFactory(),
            ssl_context= self.ssl and ssl.create_default_context() or None,
        )

    def make_blob(self, model, id, group, name, filename, hash):
        return Blob(model, id, group, name, filename, hash, hostname=self.hostname, blob_port=self.blob_port, ssl=self.ssl, token=self.token, output_dir=self.output_dir)

    def bootstrap(self):
        bootstrap_thrift = thriftpy2.load_fp(io.StringIO(self.BOOTSTRAP_THRIFT), 'satori_bootstrap_thrift')
        bootstrap_client = self.make_client(bootstrap_thrift.Server)
        self.satori_thrift = thriftpy2.load_fp(io.StringIO(bootstrap_client.Server_getIDL(self.token)), 'satori_thrift')

    def __getattr__(self, attr):
        if self.satori_thrift is None:
            self.bootstrap()
        if attr in self.satori_thrift.__dict__:
            if attr not in self.clients:
                self.clients[attr] = self.make_client(self.satori_thrift.__dict__[attr])
            return self.clients[attr]

    def authenticate(self):
        self.token = self.User.User_authenticate(self.token, self.username, self.password)

    def get_contest(self, id=None, name=None):
        search = self.satori_thrift.ContestStruct(id=id, name=name)
        contest = self.Contest.Contest_filter(self.token, search)
        if len(contest) == 1:
            return contest[0]
        raise ValueError

    ContestantTuple = collections.namedtuple('Contestant', ['id', 'name'])
    def get_contestants(self, contest_id):
        search = self.satori_thrift.ContestantStruct(contest=contest_id)
        contestants = self.Contestant.Contestant_filter(self.token, search)
        result = list()
        for contestant in contestants:
            result.append(self.ContestantTuple(id=contestant.id, name=contestant.name))
        return result

    ProblemTuple = collections.namedtuple('Problem', ['id', 'code', 'title', 'statement', 'default_test_suite'])
    def get_problems(self, contest_id):
        search = self.satori_thrift.ProblemMappingStruct(contest=contest_id)
        problems = self.ProblemMapping.ProblemMapping_filter(self.token, search)
        result = list()
        for problem in problems:
            statement = File('parameters/Problem_' + str(problem.id), 'statement.rest', problem.statement, output_dir=self.output_dir).dump()
            result.append(self.ProblemTuple(id=problem.id, code=problem.code, title=problem.title, statement=statement, default_test_suite=problem.default_test_suite))
        return result

    TestTuple = collections.namedtuple('Test', ['id', 'name', 'data'])
    def get_tests(self, test_suite_id):
        tests = self.TestSuite.TestSuite_get_tests(self.token, test_suite_id)
        result = list()
        for test in tests:
            map = self.Test.Test_data_get_map(self.token, test.id)
            data = OAMap('Test', test.id, 'data', map, output_dir=self.output_dir).dump()
            if 'kolejka' in data:
                data['kolejka'] = yaml.safe_load(io.StringIO(data['kolejka']))
            result.append(self.TestTuple(id=test.id, name=test.name, data=data))
        return result

    SolutionTuple = collections.namedtuple('Solution', ['id', 'problem', 'contestant', 'time', 'content'])
    def get_solutions(self, problem_id):
        search = self.satori_thrift.SubmitStruct(problem = problem_id)
        submits = self.Submit.Submit_filter(self.token, search)
        result = list()
        for submit in submits:
            time = submit.time
            value = self.Submit.Submit_data_get(self.token, submit.id, 'content')
            blob = self.make_blob('Submit', submit.id, 'data', value.name, value.filename, value.value)
            content = blob.dump()
            result.append(self.SolutionTuple(id=submit.id, problem=problem_id, contestant=submit.contestant, time=time, content=content))
        return result

    ResultTuple = collections.namedtuple('Result', ['id', 'submit', 'test', 'data'])
    def get_results(self, test_ids, submit_ids):
        result = list()
        for test_id in test_ids:
            search = self.satori_thrift.TestResultStruct(test=test_id, pending=False)
            for test_result in self.TestResult.TestResult_filter(self.token, search):
                if test_result.submit not in submit_ids:
                    continue
                map = self.TestResult.Entity_oa_get_map(self.token, test_result.id)
                data = OAMap('Entity', test_result.id, 'oa', map, output_dir=self.output_dir).dump()
                result.append(self.ResultTuple(id=test_result.id, submit=test_result.submit, test=test_result.test, data=data))
        return result

    RankingTuple = collections.namedtuple('Ranking', ['id', 'name', 'aggregator', 'params', 'problem_params', 'presentation', 'value'])
    def get_rankings(self, contest_id):
        search = self.satori_thrift.RankingStruct(contest = contest_id)
        rankings = self.Ranking.Ranking_filter(self.token, search)
        result = list()
        for ranking in rankings:
            map = self.Ranking.Ranking_params_get_map(self.token, ranking.id)
            params = OAMap('Ranking', ranking.id, 'params', map, output_dir=self.output_dir).dump()
            problem_params = dict()
            for problem_id, map, in self.Ranking.Ranking_get_problem_params(self.token, ranking.id).items():
                problem_params[problem_id] = dict(sorted([ (value.name, value.value) for value in map.values if not value.is_blob ]))
            map = self.Ranking.Ranking_presentation_get_map(self.token, ranking.id)
            presentation = OAMap('Ranking', ranking.id, 'presentation', map, output_dir=self.output_dir).dump()
            value = self.Ranking.Ranking_full_ranking(self.token, ranking.id)
            value = File('values/Ranking_' + str(ranking.id), 'value.rest', value, output_dir=self.output_dir).dump()
            result.append(self.RankingTuple(id=ranking.id, name=ranking.name, aggregator=ranking.aggregator, params=params, problem_params=problem_params, presentation=presentation, value=value))
        return result

    def __call__(self, id=None, name=None):
        self.authenticate()
        contest = self.get_contest(id=id, name=name)
        rankings = dict(sorted([ (ranking.id, ranking) for ranking in self.get_rankings(contest.id) ]))
        contestants = dict(sorted([ (contestant.id, contestant) for contestant in self.get_contestants(contest.id) ]))
        problems = dict(sorted([ (problem.id, problem) for problem in self.get_problems(contest.id) ]))
        solutions = dict(sorted([ (solution.id, solution) for solution in itertools.chain.from_iterable([ self.get_solutions(problem.id) for problem in problems.values() ]) ]))
        problem_tests = dict(sorted([ (problem.id, self.get_tests(problem.default_test_suite)) for problem in problems.values() ]))
        tests = dict([ (test.id, test) for test in itertools.chain.from_iterable(problem_tests.values()) ])
        test_problems = dict()
        for problem_id, problem_test in problem_tests.items():
            for test in problem_test:
                test_problems[test.id] = problem_id
        results = self.get_results(tests.keys(), solutions.keys())
        result = {
            'contest' : {
                #'satori_id' : contest.id,
                'name' : contest.name,
                'description' : contest.description,
            },
            'solutions' : dict(sorted([ (solution.id, {
                    #'satori_id' : solution.id,
                    'problem' : problems[solution.problem].code,
                    'contestant' : solution.contestant,
                    'time' : solution.time,
                    'content' : solution.content,
                }) for solution in solutions.values() ])),
            'rankings' : dict(sorted([ (ranking.name, {
                    #'satori_id' : ranking.id,
                    'script' : ranking.aggregator,
                    'params' : ranking.params,
                    'problem_params' : ranking.problem_params,
                    'presentation' : ranking.presentation,
                    'value' : ranking.value
                }) for ranking in rankings.values() ])),
            'contestants' : dict(sorted([ (contestant.id, {
                    #'satori_id' : contestant.id,
                    'name' : contestant.name,
                }) for contestant in contestants.values() ])),
            'problems' : dict(sorted([ (problem.code, {
                    #'satori_id' : problem.id,
                    'name' : problem.title,
                    'statement' : problem.statement,
                    'tests' : dict([ (test.name, test.data) for test in problem_tests[problem.id] ]),
                }) for problem in problems.values() ])),
            'results' : list([ {
                    #'satori_id' : result.id,
                    'problem' : problems[test_problems[result.test]].code,
                    'test' : tests[result.test].name,
                    'solution' : result.submit,
                    'result' : result.data,
                } for result in results ]),
        }

        output_dir = pathlib.Path(self.output_dir or '.')
        contest_yaml = 'Contest_' + str(contest.id) + '.yaml'
        ctxyaml_dump(result, output_dir/contest_yaml , work_dir=output_dir)
        return result





if __name__ == '__main__':
    username='a'
    password='b'
    contest_name='uzi'
    output_dir=contest_name
    satori = SatoriDumper(username, password, output_dir=output_dir)
    satori(name=contest_name)

# vim:ts=4:sts=4:sw=4:expandtab

from kolejka.merchant.satori import SatoriDumper

def merchant(username, password, hostname, thrift_port, blob_port, contest_name, output_dir):
    satori = SatoriDumper(username, password, hostname=hostname, thrift_port=thrift_port, blob_port=blob_port, ssl=True, output_dir=output_dir)
    satori(name=contest_name)

def config_parser(parser):
    parser.add_argument('username', type=str, help='Satori Username')
    parser.add_argument('password', type=str, help='Satori Password') #TODO: Fix this!
    parser.add_argument('contest', type=str, help='Satori Contest Name')
    parser.add_argument('output', type=str, help='Output Directory')
    parser.add_argument('--hostname', type=str, default='satori.tcs.uj.edu.pl', help='Server Hostname')
    parser.add_argument('--thrift-port', type=int, default=2889, help='Server Thrift Port')
    parser.add_argument('--blob-port', type=int, default=2887, help='Server Blob Port')

    def execute(args):
        merchant(args.username, args.password, args.hostname, args.thrift_port, args.blob_port, args.contest, args.output)
    parser.set_defaults(execute=execute)

# vim:ts=4:sts=4:sw=4:expandtab

import pathlib
import yaml

from kolejka.merchant.satori import SatoriDumper

from kolejka.judge.ctxyaml import ctxyaml_load, ctxyaml_dump

def merchant(username, password, contest_name, output_dir):
    satori = SatoriDumper(username, password, output_dir=output_dir)
    satori(name=contest_name)

def config_parser(parser):
    parser.add_argument('username', type=str, help='Satori Username')
    parser.add_argument('password', type=str, help='Satori Password') #TODO: Fix this!
    parser.add_argument('contest', type=str, help='Satori Contest Name')
    parser.add_argument('output', type=str, help='Output Directory')
    def execute(args):
        merchant(args.username, args.password, args.contest, args.output)
    parser.set_defaults(execute=execute)

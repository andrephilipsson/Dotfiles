from argparse import ArgumentParser
from commands.terminfo import TerminfoCommand


def parse_input():
    parser = ArgumentParser(
        prog="dot",
        # TODO
        description=""
    )
    subparsers = parser.add_subparsers()

    # Terminfo subparser
    terminfo_subparser = subparsers.add_parser("terminfo", help="compile and link terminfo files")
    terminfo_subparser.set_defaults(func=TerminfoCommand.execute)
    terminfo_subparser.add_argument("--dry-run", action="store_true", help="show what would be done")

    args = parser.parse_args()
    args.func(args)


if __name__ == "__main__":
    parse_input()

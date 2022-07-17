import subprocess
from pathlib import Path, PurePath
from .command import Command

class TerminfoCommand(Command):

    @classmethod
    def execute(cls, args):
        dir = PurePath(__file__).parent.parent.parent
        path = Path(dir.joinpath("aspects/terminfo"))
        print(path)
        files = path.glob("*.terminfo")
        if args.dry_run:
            print("These files would be linked:")
        for file in files:
            command = ["tic", "-x", file.as_posix()]
            if not args.dry_run:
                subprocess.run(command)
            else:
                print(f"  {command[-1]}")

import * as fs from "fs";

type SymlinkArgs = {
  source: PathLike;
  destination: PathLike;
};

function symlink({ source, destination }: SymlinkArgs) {
  fs.symlink(source, destination, () => {
    console.log(`[DOTS]: Symlinked ${source} to ${destination}`);
  });
}

export { symlink };

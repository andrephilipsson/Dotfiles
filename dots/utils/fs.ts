import * as fs from "fs";

function symlink(source: PathLike, destination: PathLike) {
  fs.symlink(source, destination, () => {
    console.log(`[DOTTY]: Symlinked ${source} to ${destination}`);
  });
}

export { symlink };

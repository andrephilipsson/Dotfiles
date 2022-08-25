import { task, path, fs } from "~/index";

const cwd = import.meta.dir;

task("Symlink .hushlogin to ~", () => {
  fs.symlink({
    source: `${cwd}/files/.hushlogin`,
    destination: `${path.home}/.hushlogin`
  });
});

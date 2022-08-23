import task from "~/dsl/task";
import { symlink } from "~/utils/fs";

const cwd = import.meta.dir;
const home = process.env.HOME;

task("Symlink .hushlogin to ~", () => {
  symlink(`${cwd}/files/.hushlogin`, `${home}/.hushlogin`);
});

export {};

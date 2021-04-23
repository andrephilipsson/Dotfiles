local typescriptreact = {}

typescriptreact.component = [[
interface ${1:ComponentName}Props {};

const $1 = (): JSX.Element => {
  return ($0);
}

export default $1;]]

return typescriptreact

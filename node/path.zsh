eval "$(fnm env --use-on-cd)"

export PNPM_HOME="/Users/ape/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

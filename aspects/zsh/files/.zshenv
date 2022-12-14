# Override insanely low open file limits on macOS.
ulimit -n 65536
ulimit -u 1064

# Mitigate: https://github.blog/2022-04-12-git-security-vulnerability-announced/
export GIT_CEILING_DIRECTORIES=/Users

test -d $HOME/.volta && export VOLTA_HOME="$HOME/.volta"
test -d $HOME/.n && export N_PREFIX="$HOME/.n"

export EDITOR="nvim"

# Override insanely low open file limits on macOS.
ulimit -n 65536
ulimit -u 1064

# Mitigate: https://github.blog/2022-04-12-git-security-vulnerability-announced/
export GIT_CEILING_DIRECTORIES=/Users

! [ -e $HOME/.volta ] && mkdir ~/.volta
! [ -e $HOME/.n ] && mkdir ~/.n

export VOLTA_HOME="$HOME/.volta"
export N_PREFIX="$HOME/.n"

export EDITOR="nvim"

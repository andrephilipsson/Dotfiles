#!/bin/sh

set -e

if tmux has-session -t=dot 2> /dev/null; then
  tmux attach -t dot
  exit
fi

tmux new-session -d -s dot -n nvim -x $(tput cols) -y $(tput lines)

tmux split-window -t dot:nvim -h

tmux send-keys -t dot:nvim.left "vim -c 'Telescope find_files hidden=true'" Enter
tmux send-keys -t dot:nvim.right "git st" Enter

tmux attach -t dot:nvim.right

nnoremap <leader>ff <cmd> <cr>

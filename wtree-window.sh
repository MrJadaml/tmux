#!/bin/bash

WORK_SESSION="Heard"

tmux new-window -t $WORK_SESSION: -n 'APP'
tmux split-window -h -t $WORK_SESSION:APP
tmux split-window -v -t $WORK_SESSION:APP

tmux send-keys -t $WORK_SESSION:APP.1 'cd ~/code/heard-app' C-m
tmux send-keys -t $WORK_SESSION:APP.1 'im' C-m
tmux send-keys -t $WORK_SESSION:APP.1 ':NvimTreeToggle<CR>' C-m
tmux send-keys -t $WORK_SESSION:APP.2 'cd ~/code/heard-app' C-m
tmux send-keys -t $WORK_SESSION:APP.2 'npm run dev' C-m
tmux send-keys -t $WORK_SESSION:APP.3 'cd ~/code/heard-app' C-m

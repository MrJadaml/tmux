#!/bin/bash

WORK_SESSION="Heard"
MY_SESSION="Jadam"
CONFIG_SESSION="Config"

# Start Work session
tmux new-session -d -s $WORK_SESSION

tmux rename-window -t $WORK_SESSION 'API'
tmux split-window -h -t $WORK_SESSION:API
tmux split-window -v -t $WORK_SESSION:API

tmux send-keys -t $WORK_SESSION:API.1 'cd ~/code/heard-api' C-m
tmux send-keys -t $WORK_SESSION:API.1 'vim' C-m
tmux send-keys -t $WORK_SESSION:API.1 ':NvimTreeToggle<CR>' C-m
tmux send-keys -t $WORK_SESSION:API.2 'cd ~/code/heard-api' C-m
tmux send-keys -t $WORK_SESSION:API.2 'npm run dev' C-m
tmux send-keys -t $WORK_SESSION:API.3 'cd ~/code/heard-api' C-m


tmux new-window -t $WORK_SESSION: -n 'APP'
tmux split-window -h -t $WORK_SESSION:APP
tmux split-window -v -t $WORK_SESSION:APP

tmux send-keys -t $WORK_SESSION:APP.1 'cd ~/code/heard-app' C-m
tmux send-keys -t $WORK_SESSION:APP.1 'vim' C-m
tmux send-keys -t $WORK_SESSION:APP.1 ':NvimTreeToggle<CR>' C-m
tmux send-keys -t $WORK_SESSION:APP.2 'cd ~/code/heard-app' C-m
tmux send-keys -t $WORK_SESSION:APP.2 'npm run dev' C-m
tmux send-keys -t $WORK_SESSION:APP.3 'cd ~/code/heard-app' C-m

# # Start Personal session
tmux new-session -d -s $MY_SESSION

tmux rename-window -t $MY_SESSION 'Foo'
tmux split-window -h -t $MY_SESSION:Foo

tmux send-keys -t $MY_SESSION:Foo.1 'cd ~/code' C-m
tmux send-keys -t $MY_SESSION:Foo.1 'vim' C-m
tmux send-keys -t $MY_SESSION:Foo.1 ':NvimTreeToggle<CR>' C-m
tmux send-keys -t $MY_SESSION:Foo.2 'cd ~/code' C-m


# Start Config session
tmux new-session -d -s $CONFIG_SESSION

tmux rename-window -t $CONFIG_SESSION 'Tmux'
tmux send-keys -t $CONFIG_SESSION:Tmux.1 'cd ~/.config/tmux' C-m
tmux send-keys -t $CONFIG_SESSION:Tmux.1 'vim' C-m
tmux send-keys -t $CONFIG_SESSION:Tmux.1 ':NvimTreeToggle<CR>' C-m
tmux send-keys -t $CONFIG_SESSION:Tmux.2 'cd ~/.config/tmux' C-m


tmux new-window -t $CONFIG_SESSION: -n 'Neo'
tmux send-keys -t $CONFIG_SESSION:Neo.1 'cd ~/.config/nvim' C-m
tmux send-keys -t $CONFIG_SESSION:Neo.1 'vim' C-m
tmux send-keys -t $CONFIG_SESSION:Neo.1 ':NvimTreeToggle<CR>' C-m


tmux new-window -t $CONFIG_SESSION: -n 'ZMK'
tmux send-keys -t $CONFIG_SESSION:ZMK.1 'cd ~/jadam/zmk-config' C-m
tmux send-keys -t $CONFIG_SESSION:ZMK.1 'vim' C-m
tmux send-keys -t $CONFIG_SESSION:ZMK.1 ':NvimTreeToggle<CR>' C-m


# Start Notes session
tmux new-session -d -s Notes -c ~/Notes
tmux send-keys -t Notes 'vim' C-m
tmux send-keys -t Notes ':NvimTreeToggle<CR>' C-m


# Attach to the Notes session
tmux attach -t Notes

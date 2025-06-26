#!/bin/bash

session=tomos

cd /Users/yehara/work/Tomos
tmux new-session -d -s $session

tmux rename-window work
tmux new-window -t $session -n mysql
tmux new-window -t $session -n staging
tmux new-window -t $session -n mr

tmux send-keys -t $session:0 'docker compose up -d' Enter
tmux send-keys -t $session:1 'mycli -h127.0.0.1 -uroot -ppassword -P13306' Enter
tmux send-keys -t $session:2 'ssh tomos.moove.bz' Enter
tmux send-keys -t $session:3 'cd /Users/yehara/Documents/Obsidian\ Vault/' Enter

tmux split-window -v -t $session:0
tmux select-window -t $session:0.0
tmux resize-pane -D 70
tmux split-window -h -t $session:0.1

tmux send-keys -t $session:0.1 'docker compose logs -f --tail 300 app' Enter
tmux select-window -t $session:0.0
tmux a -t $session

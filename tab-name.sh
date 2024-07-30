#!/bin/bash

# Get the current tmux session name
session_name=$(tmux display-message -p '#S')

# Escape spaces in the session name
escaped_session_name=$(printf "%q" "$session_name")

# Update the kitty tab title
echo -e "\033]2;$escaped_session_name\007"

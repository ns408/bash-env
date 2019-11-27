#!/usr/bin/env bash

[[ -d /etc/profile.d ]] && \
sudo cat > /etc/profile.d/ns_custom_bash <<EOF
# Memory
HISTSIZE=10000
# Disk
HISTFILESIZE=2000000
# Append instead of overwrite
shopt -s histappend
# Ignore redundant or space commands
HISTCONTROL=ignoreboth
HISTCONTROL=ignoredups
HISTIGNORE='ls:ll:ls -alh:pwd:clear:history'
# Set time format
HISTTIMEFORMAT='%F %T '
# Multiple commands on one line show up as a single line
shopt -s cmdhist
# Append new history lines, clear the history list, re-read the history list, print prompt.
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export EDITOR=$(which vim || which vi)
export VISUAL=$(which vim || which vi)
EOF

cat > ${HOME}/.inputrc <<EOF
set editing-mode vim
EOF

#!/bin/bash

cp ../software/git/gitconfig ~/.gitconfig
cp ../software/vim/.vimrc ~/.vimrc

cat >> ~/.bashrc <<EOF
PS1='${debian_chroot:+($debian_chroot)}\[\033[00;35m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
EOF

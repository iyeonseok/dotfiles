#!/usr/bin/env bash

setup_script_path=$(pwd)/$0
dotfiles_root_path=$(dirname $setup_script_path)

function main {
  link_file bash/bashrc ~/.bashrc
  link_file bash/bash_profile ~/.bash_profile

  link_file git/gitconfig ~/.gitconfig
  link_file git/gitignore ~/.gitignore

  git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect
  link_file tmux/tmux.conf ~/.tmux.conf

  link_file vim/vimrc ~/.vim/vimrc
}

function link_file {
  local source=$dotfiles_root_path/$1
  local target=$2

  if [ -f $target ]
  then
    rm $target
    echo removed $target
  fi

  ln -s $source $target
  echo made symbolic link from $target to $source
}

main $@

#!/usr/bin/env bash

script_path=$(pwd)/$0
dotfiles_root_path=$(dirname $script_path)

function main {
  setup_bash
  setup_git
  setup_tmux
  setup_vim
}

function setup_bash {
  link_file bash/bashrc ~/.bashrc
  link_file bash/bash_profile ~/.bash_profile
}

function setup_git {
  link_file git/gitconfig ~/.gitconfig
  link_file git/gitignore ~/.gitignore
}

function setup_tmux {
  git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect
  link_file tmux/tmux.conf ~/.tmux.conf
}

function setup_vim {
  link_file vim/vimrc ~/.vim/vimrc
  link_file vim/indent/python.vim ~/.vim/indent/python.vim
  git clone https://github.com/vim-python/python-syntax.git ~/.vim/pack/python/start/python-syntax
}

function link_file {
  local source=$dotfiles_root_path/$1
  local target=$2

  ln -s $source $target
  echo made symbolic link from $target to $source
}

main $@

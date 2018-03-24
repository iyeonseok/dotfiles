#!/usr/bin/env bash

script_path="$(pwd)/${0}"
dotfiles_root_path="$(dirname ${script_path})"

function main {
  update_git_submodules
  link_all
}

function update_git_submodules {
  git submodule update --init
}

function link_all {
  setup_bash
  setup_git
  setup_tmux
  setup_vim
}

function setup_bash {
  link bash/bashrc ~/.bashrc
  link bash/bash_profile ~/.bash_profile
}

function setup_git {
  link git/gitconfig ~/.gitconfig
  link git/gitignore ~/.gitignore
}

function setup_tmux {
  link tmux/tmux.conf ~/.tmux.conf
  link tmux/plugins/ ~/.tmux/
}

function setup_vim {
  link vim/vimrc ~/.vim/vimrc
  link vim/pack/javascript/start/vim-javascript/ ~/.vim/pack/javascript/start/
}

function link {
  local source="${dotfiles_root_path}/${1}"
  local target="${2}"

  ln -s ${source} ${target}
  echo "made symbolic link from ${target} to ${source}"
}

main $@

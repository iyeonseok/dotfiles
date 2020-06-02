export VISUAL=vim

if [[ -e ~/.git_completion.bash ]]; then
  source ~/.git_completion.bash
fi

eval "$(starship init bash)"

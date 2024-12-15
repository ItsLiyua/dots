ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

export GPG_TTY=$(tty)

alias v="nvim"
alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias clear="clear; pfetch"

pfetch

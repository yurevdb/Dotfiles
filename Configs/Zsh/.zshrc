if [[ $TMUX = "" ]]; then
	#try to reattach sessions
  tmux ls | grep -vq attached && TMUXARG="attach-session -d"
	exec eval "tmux -2 -u $TMUXARG"
fi

# setup base16 shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"

# Path to your oh-my-zsh installation.
export ZSH="/home/yure/.oh-my-zsh"

# Theme
ZSH_THEME="nord"

# plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# General Settings
unsetopt BEEP

# Aliases
alias rl="source ~/.zshrc"
alias vimrc="nvim ~/.config/nvim/init.vim"
alias vim="nvim"
alias rs="/home/yure/.scripts/run_script.sh"
alias l="exa --all --long --header"
alias open="wsl-open"

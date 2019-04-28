if [[ $TMUX = "" ]]; then
	#try to reattach sessions
	tmux ls | grep -vq attached && TMUXARG="attach-session -d"
	exec eval "tmux -2 $TMUXARG"
fi

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

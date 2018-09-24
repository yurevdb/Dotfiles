#!/bin/bash

############
# Neovim
############

# Install neovim or update neovim (doesn't hurt anyone to update is it's already installed)
sudo apt-get install neovim

# Check if the init.vim file exists in ~/.config/nvim
if [ ! -f ~/.config/nvim/init.vim ]; then
	cp ./init.vim ~/.config/nvim/
fi

############
# Zsh
############

# Install zsh of update it
sudo apt-get install zsh

# Install curl to be able to install oh-my-zsh config
sudo apt-get install curl

# Finally install 0h-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# If the .zshrc already exists, replace it with the .zshrc from the dotfiles
if [ -f ~/.zshrc ]; then
	rm ~/.zshrc
	cp ./.zshrc ~/
fi

############
# Tmux
############

# Install tmux
sudo apt-get install tmux

# If there already is a tmux config file, replace it
if [ -f ~/.tmux.conf ]; then
	rm ~/.tmux.conf
	cp ./.tmux.conf ~/
fi


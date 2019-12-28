#!/bin/bash

# Script directory 
SCRIPT_DIR=$( cd "$(dirname "$0")" ; pwd )
echo "Script directory: ${SCRIPT_DIR}"

# Install fzf
if [ ! -d ~/.fzf ]; then
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
fi

# Install vim-plug for nvim
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

NVIM_CONFIG_HOME=~/.config/nvim
if [ ! -d $NVIM_CONFIG_HOME ]; then
	mkdir -p $NVIM_CONFIG_HOME
fi
ln -s -f $SCRIPT_DIR/init.vim $NVIM_CONFIG_HOME/init.vim
ln -s -f $SCRIPT_DIR/ginit.vim $NVIM_CONFIG_HOME/ginit.vim
ln -s -f $NVIM_CONFIG_HOME/init.vim ~/.vimrc
nvim +PlugInstall +qall

# Install tmux config
if [ ! -d ~/.tmux ]; then
  git clone https://github.com/gpakosz/.tmux.git ~/.tmux
  ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
  cp ~/.tmux/.tmux.conf.local ~/
fi


ln -s -f $SCRIPT_DIR/.gitconfig ~/.gitconfig

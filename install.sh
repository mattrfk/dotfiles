#!/bin/bash

touch ~/.bashrc ~/.vimrc

src_bash="source ~/dotfiles/bashrc"
src_vim="source ~/dotfiles/vimrc"

if grep -q "$src_bash" ~/.bashrc; then
	echo "bashrc already linked"
else 
	echo "adding link to bashrc"
	echo "$(echo "$src_bash"  | cat - ~/.bashrc)" > ~/.bashrc
fi

if grep -q "$src_vim" ~/.vimrc; then
	echo "vimrc already linked"
else 
	echo "adding link to vimrc"
	echo "$(echo "$src_vim"  | cat - ~/.vimrc)" > ~/.vimrc
fi

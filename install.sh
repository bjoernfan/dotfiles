#!/bin/bash

ln -fs `pwd`/.vim       ~/.vim
ln -fs `pwd`/.vimrc     ~/.vimrc
ln -fs `pwd`/.gvimrc    ~/.gvimrc
ln -fs `pwd`/.zshrc     ~/.zshrc
ln -fs `pwd`/.gitconfig ~/.gitconfig
ln -fs `pwd`/.tmux.conf ~/.tmux.conf
ln -fs `pwd`/.lbdbrc    ~/.lbdbrc

if test -d ~/src/oh-my-zsh
then
  ln -fs ~/src/oh-my-zsh ~/.oh-my-zsh
fi

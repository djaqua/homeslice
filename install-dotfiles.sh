#!/bin/bash
dotfiles_location="${PWD}/dotfiles"


ln -sf $dotfiles_location/vimrc ${HOME}/.vimrc
ln -sf $dotfiles_location/gitconfig ${HOME}/.gitconfig



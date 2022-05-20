#!/bin/bash

echo "linking neovim"
ln -snfv ~/dotfiles/.config/nvim ~/.config/nvim

echo "linking alacritty"
ln -snfv ~/dotfiles/.config/alacritty ~/.config/alacritty

echo "linking starship"
ln -snfv ~/dotfiles/.config/starship.toml ~/.config/starship.toml

echo "linking fish"
ln -snfv ~/dotfiles/.config/fish ~/.config/fish

# echo "installing brews"
# bundle brew
#
# echo "install fzf keybindings"
# /usr/local/opt/fzf/install

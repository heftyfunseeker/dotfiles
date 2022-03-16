#!/bin/bash

echo "linking NvChad custom config"
ln -snfv ~/dotfiles/.config/nvchad/custom ~/.config/nvim/lua/custom

echo "linking alacritty"
ln -snfv ~/dotfiles/.config/alacritty ~/.config/alacritty

echo "linking fish"
ln -snfv ~/dotfiles/.config/fish ~/.config/fish

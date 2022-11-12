#!/bin/bash

echo "linking neovim"
ln -snfv ~/dotfiles/.config/nvim ~/.config/nvim

echo "linking alacritty"
ln -snfv ~/dotfiles/.config/alacritty ~/.config/alacritty

echo "linking starship"
ln -snfv ~/dotfiles/.config/starship.toml ~/.config/starship.toml

echo "linking fish"
ln -snfv ~/dotfiles/.config/fish ~/.config/fish

echo "linking kitty"
ln -snfv ~/dotfiles/.config/kitty ~/.config/kitty

echo "linking wezterm"
ln -snfv ~/dotfiles/.config/wezterm ~/.config/wezterm

echo "linking helix"
ln -snfv ~/dotfiles/.config/helix ~/.config/helix

# echo "installing brews"
# bundle brew
#
# echo "install fzf keybindings"
# /usr/local/opt/fzf/install

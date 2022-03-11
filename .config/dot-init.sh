#!/bin/bash

echo "linking NvChad custom config"
rm -r ~/.config/nvim/lua/custom
ln -s ~/.config/nvchad/custom ~/.config/nvim/lua/custom

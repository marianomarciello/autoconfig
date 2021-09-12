#!/usr/bin/sh
# Create a copy of the actual configuration

echo "Updating nvim and tmux"
#nvim
cp ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bk

cp init.vim ~/.config/nvim/init.vim

#tmux
cp ~/.tmux.conf ~/.tmux.conf.bk

cp tmux.conf ~/.tmux.conf

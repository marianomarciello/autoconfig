# Dotfiles

Stow compatible dotfiles.
This repo contains dotfiles for the following tools:

*  neovim
*  tmux
* 󰄨 polybar
*  i3
*  zellij
*  leftwm

## Usage

To install all the configuration files use the following command:

```sh
cd dotfiles
stow . -t $HOME
```

If only one tool needs to be installed (e.g. zeelij) use the following command:

```sh
cd dotfiles/.config
stow zellij -t $HOME/.config/zellij
```

#!/usr/bin/sh
# Create a copy of the actual configuration

NVIM_CONFIG=$HOME/.config/nvim/init.vim
TMUX_CONFIG=$HOME/.tmux.conf
POLYBAR_CONFIG=$HOME/.config/polybar/config.ini
POLYBAR_LAUNCH=$HOME/.config/polybar/launch.sh

echo_green() {
    printf "\e[32m$1\e[0m"
}
echo_red() {
    printf "\e[31m$1\e[0m"
}
echo_blue() {
    printf "\e[34m$1\e[0m"
}

intro() {
    echo "Script for basic costumization of a new OS (Archbased)."
    echo "This script install tmux and nvim and try to configure them as usual"
    echo " _   _                 "
    echo "| \ | | __ _ _ __ __ _ "
    echo "|  \| |/ _\` | '__/ _\` |"
    echo "| |\  | (_| | | | (_| |"
    echo "|_| \_|\__,_|_|  \__,_|"
    echo "                       "
    echo "Credits: https://github.com/marianomarciello"
    echo -e "\n"
}

install_configure() {
    # intput: package-name, local_file, configuration_file
    # local_file: local with configuration in this directory
    # configuration_file: absoulte path of the configuration
    pkg=$1
    local_file=$2
    config_file=$3
    echo_blue "=Installing $pkg=\n"
    if [[ ! $(pacman -Q | grep $pkg) ]]; then
        sudo pacman -S $pkg
    fi
    echo "Updating configuration file in $config_file"
    if [[ -f "$config_file" ]]; then
        cp $config_file $config_file.bk
    fi
    if ! $(cp $local_file $config_file) ; then
        echo_red "$pkg configuration failed!\n"
        return -1
    fi
    echo_green "$pkg configuration success!\n"
    return 0
}

intro
install_configure neovim config/init.vim $NVIM_CONFIG
install_configure tmux config/tmux.conf $TMUX_CONFIG
install_configure polybar config/config.ini $POLYBAR_CONFIG
install_configure polybar config/launch.sh $POLYBAR_LAUNCH

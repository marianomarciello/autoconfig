#!/usr/bin/sh
# Create a copy of the actual configuration

NVIM_CONFIG=$HOME/.config/nvim/init.vim
TMUX_CONFIG=$HOME/.tmux.conf
POLYBAR_CONFIG=$HOME/.config/polybar/config.ini
POLYBAR_LAUNCH=$HOME/.config/polybar/launch.sh
I3_CONFIG=$HOME/.config/i3/config
ZELLIJ_CONFIG=$HOME/.config/zellij/config.kdl
LEFTWM_CONFIG=$HOME/.config/leftwm/config.ron

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
    echo_blue "[+] Installing $pkg\n"
    if [[ ! $(pacman -Q | grep $pkg) ]]; then
        sudo pacman -S $pkg
    fi
    echo "[+] Updating configuration file in $config_file"
    if [[ -f "$config_file" ]]; then
        cp $config_file $config_file.bk
    fi
    if ! $(cp $local_file $config_file) ; then
        echo_red "[Error] $pkg configuration failed!\n"
        return -1
    fi
    echo_green "[Success] $pkg configuration success!\n"
    return 0
}

intro
install_configure  neovim   config/nvim-config        $NVIM_CONFIG
install_configure  tmux     config/tmux.conf          $TMUX_CONFIG
install_configure  polybar  config/polybar-config     $POLYBAR_CONFIG
install_configure  polybar  config/launch-polybar.sh  $POLYBAR_LAUNCH
install_configure  i3       config/i3-config          $I3_CONFIG
install_configure  zellij   config/zellij-config      $ZELLIJ_CONFIG
install_configure  leftwm   config/leftwm-config      $LEFTWM_CONFIG

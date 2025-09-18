#!/bin/bash

YELLOW="\e[1;33m"
MAGENTA="\e[35m"
ENDC="\e[0m"

echo -e $YELLOW"🔥 VOID LINUX DEVELOPER SETUP 🔥"$ENDC

./install_base_packages.sh
./setup_suckless_tools.sh
./setup_desktop.sh
./setup_vim.sh
./setup_bash.sh

echo -e $MAGENTA"Setup Environment ..."$ENDC
mv ./src $HOME/

echo -e $MAGENTA"Rebooting the system ..."$ENDC
doas reboot

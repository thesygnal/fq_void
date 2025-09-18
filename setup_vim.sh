#!/bin/bash

YELLOW="\e[1;33m"
GREEN="\e[1;32m"
RED="\e[1;31m"
ENDC="\e[0m"
WARN="\e[93m"

if ! command -v vim &> /dev/null; then
    echo -e $RED"Vim is not installed. Please install Vim and run this script again."$ENDC
    exit 1
fi

setup_vim_props() {
    echo -e $YELLOW"Setting up vim props ..."$ENDC
    cat > ~/.vimrc << EOL
" Props
set     nocompatible
set     number
set     tabstop=2
set     shiftwidth=2
set     expandtab
set     smartcase
set     autoindent
set     smartindent
set     hlsearch
set     incsearch
set     showmatch
set     cursorline
set     encoding=UTF-8
set     foldenable
set     foldmethod=indent
set     foldlevelstart=10
syntax  on

" Plugins

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'ryanoasis/vim-devicons'
Plugin 'ghifarit53/tokyonight-vim'

call vundle#end()

filetype plugin indent on

let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1

colorscheme tokyonight
EOL
}

install_vundle() {
    echo -e $YELLOW"Installing Vundle vim ..."$ENDC
    if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    else
        echo -e $WARN"Vundle is already installed."$ENDC
    fi
}

install_plugins() {
    echo -e $YELLOW"Installing plugins ..."$ENDC
    vim +PluginInstall +qall
}

main() {
    setup_vim_props
    install_vundle
    install_plugins
    echo -e $GREEN"Vim setup complete!"$ENDC
}

main

{ config, lib, pkgs, ... }: {
	programs.nano.enable = false;
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
		configure.customRC = ''
set autoindent
set tabstop=2
set softtabstop=2
set expandtab

set number
set relativenumber

set wrap!

set ignorecase
set smartcase

set termguicolors
set background=dark
set signcolumn=yes
set backspace=indent,eol,start
set clipboard=unnamedplus

set splitright
set splitbelow

set conceallevel=2

set scrolloff=10
set sidescrolloff=20

set cursorline
set autoread
		'';
	};
}

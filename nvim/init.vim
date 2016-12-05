" Don't try to support vi
set nocompatible

set encoding=utf-8 " default character encoding

" Set leader keys before anything else
let mapleader      = " "
let maplocalleader = ","

filetype off
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-markdown'
Plug 'jgdavey/vim-blockle'
Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-eunuch'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jnurmine/Zenburn'
Plug 'scrooloose/syntastic'

call plug#end()

filetype plugin indent on

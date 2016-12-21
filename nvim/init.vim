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
Plug 'kana/vim-smartinput' " To have automatic closed pairs like () or {}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'jgdavey/vim-blockle'
Plug 'neomake/neomake'
Plug 'kassio/neoterm'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-eunuch' " Syntax sugar for unix commands
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
Plug 'jnurmine/Zenburn'
Plug 'sjl/gundo.vim'

call plug#end()

filetype plugin indent on

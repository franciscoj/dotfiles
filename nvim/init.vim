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
Plug 'tpope/vim-repeat'
Plug 'neomake/neomake'
Plug 'kassio/neoterm'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch' " Syntax sugar for unix commands
Plug 'jnurmine/Zenburn'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Language support
Plug 'jgdavey/vim-blockle'
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'fishbullet/deoplete-ruby'

call plug#end()

source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/keys.vim
source $HOME/.config/nvim/markdown.vim
source $HOME/.config/nvim/neomake.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/statusline.vim

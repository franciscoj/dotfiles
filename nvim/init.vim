set encoding=utf-8 " default character encoding

" Set leader keys before anything else
let mapleader      = " "
let maplocalleader = ","

filetype off
call plug#begin()

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'kana/vim-smartinput' " To have automatic closed pairs like () or {}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'neomake/neomake'
Plug 'jaawerth/neomake-local-eslint-first'
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch' " Syntax sugar for unix commands
Plug 'jnurmine/Zenburn'
Plug 'eiginn/netrw' " Overwrite vim's netrw with the latest version
Plug 'sjl/gundo.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Language support
Plug 'jgdavey/vim-blockle'
Plug 'sheerun/vim-polyglot'
Plug 'noprompt/vim-yardoc'
Plug 'plasticboy/vim-markdown'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'pangloss/vim-javascript'
Plug 'PotatoesMaster/i3-vim-syntax'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'

" Autocomplete
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'fishbullet/deoplete-ruby'

call plug#end()

source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/keys.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/statusline.vim

if filereadable('~/.config/nvim/local.vim')
  source $HOME/.config/nvim/local.vim
endif

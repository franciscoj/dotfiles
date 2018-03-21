set encoding=utf-8 " default character encoding

" Set leader keys before anything else
let mapleader      = " "
let maplocalleader = ","

filetype off
call plug#begin()

" Thank to the universe for Tim Pope
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch' " Syntax sugar for unix commands
Plug 'tpope/vim-obsession' " Supercool session management
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-projectionist'

Plug 'kana/vim-smartinput' " To have automatic closed pairs like () or {}
Plug 'w0rp/ale'
Plug 'embear/vim-localvimrc'
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'
Plug 'radenling/vim-dispatch-neovim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jnurmine/Zenburn'
Plug 'eiginn/netrw' " Overwrite vim's netrw with the latest version
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'FooSoft/vim-argwrap'

" Git
Plug 'mhinz/vim-signify'

" Language support
Plug 'ElmCast/elm-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'plasticboy/vim-markdown'
Plug 'noprompt/vim-yardoc'
Plug 'jgdavey/vim-blockle'
Plug 'sheerun/vim-polyglot'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'pangloss/vim-javascript'
Plug 'PotatoesMaster/i3-vim-syntax'

" Search
Plug '/usr/local/opt/fzf' " Use locally instaled fzf from homebrew
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'brooth/far.vim'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'pbogut/deoplete-elm'
Plug 'fishbullet/deoplete-ruby'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

call plug#end()

" filetype plugin indent on
" syntax enable

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/keys.vim
source $HOME/.config/nvim/statusline.vim
source $HOME/.config/nvim/projections.vim

" Change diff signs
" This has to be after the general.vim loading since loading the colorscheme
" overwrites this... however I can't add it to the plugins.vim file and load
" that after the general.vim because the neomake autocommands for the colors
" need to be defined before loading the colorscheme :D cool, eh?

highlight DiffAdd           cterm=bold ctermbg=none ctermfg=2
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=1
highlight DiffChange        cterm=bold ctermbg=none ctermfg=4

highlight SignifySignAdd    cterm=bold ctermbg=none ctermfg=2
highlight SignifySignDelete cterm=bold ctermbg=none ctermfg=1
highlight SignifySignChange cterm=bold ctermbg=none ctermfg=4

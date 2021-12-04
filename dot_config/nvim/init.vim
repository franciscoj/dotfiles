" vim: fdm=marker fmr={{{,}}} fdl=0 fen

set encoding=utf-8 " default character encoding
scriptencoding utf-8

" Set leader keys before anything else
let mapleader      = ' '
let maplocalleader = ','

" Get the OS name so that we can do some silly OS only stuff with it.
let os = substitute(system('uname'), "\n", '', '')

filetype off

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins install {{{
call plug#begin()

" Thank to the universe for Tim Pope {{{
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-characterize'
Plug 'kassio/neoterm'
Plug 'cohama/lexima.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'vim-airline/vim-airline'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdtree'
Plug 'embear/vim-localvimrc'
Plug 'sirver/ultisnips'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'junegunn/vim-easy-align'
let g:highlightedyank_highlight_duration = 200
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim'
Plug 'janko-m/vim-test'
Plug 'FooSoft/vim-argwrap'
Plug 'AndrewRadev/splitjoin.vim'
"}}}
"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" }}}

call plug#end()
"}}}

" Config {{{

" Look & Feel {{{

" Show both current line number and relative number
set relativenumber
set number

" Dracula colrscheme setup {{{
set background=dark
set termguicolors
colorscheme dracula
"}}}

let g:goyo_width=120
let g:goyo_height=100

" }}}

" Status line {{{
" Don't display encoding unless it is unexpected
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" Use abbreviations to display modes
let g:airline_mode_map = {
                  \ '__'     : '-',
                  \ 'c'      : 'C',
                  \ 'i'      : 'I',
                  \ 'ic'     : 'I',
                  \ 'ix'     : 'I',
                  \ 'n'      : 'N',
                  \ 'multi'  : 'M',
                  \ 'ni'     : 'N',
                  \ 'no'     : 'N',
                  \ 'R'      : 'R',
                  \ 'Rv'     : 'R',
                  \ 's'      : 'S',
                  \ 'S'      : 'S',
                  \ ''     : 'S',
                  \ 't'      : 'T',
                  \ 'v'      : 'V',
                  \ 'V'      : 'V',
                  \ ''     : 'V',
                  \ }

let g:airline_theme='dracula'
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#nerdtree_statusline = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr'])
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

"}}}

" Show non visual chars
set listchars=trail:~,tab:\|>,eol:¬ " show special characters
set list

" To use the system clipboard (xclip)
set clipboard=unnamed,unnamedplus

" Folding
set foldmethod=syntax
set nofoldenable
set fillchars+=fold:·
set foldtext=dot#CustomFoldtext()
"}}}

" Edit {{{

" Go to Normal mode fast
inoremap jj <ESC>
inoremap <ESC> <NOP>
inoremap ;; ::

" Indention {{{
set tabstop=2      " number of visual spaces per TAB.
set shiftwidth=2   " number of spaces to use for each step of (auto)indent.
set softtabstop=2  " number of spaces in tab when editing.
set shiftround     " round indent to multiple of 'shiftwidth'
set expandtab      " tabs are spaces
set smarttab
set autoindent
set copyindent
set smartindent
"}}}

" Best options for changing text
set cpoptions+=$

" Allows to use modelines. Modelines are indications for vim on the editing
" files with small configurations like indenting rules, etc.
"
" See an example at the top of this file.
set modeline
set nowrap " Disable word wrap

" ArgWrap
nnoremap <silent><leader>a :ArgWrap<CR>

" split-join
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0


" Add characters to the end of the line and go back to the spot in which you
" were.
"
" This saves the current cursor location on mark `z`, adds the new character,
" goes back to the previous location and removes the mark.
nnoremap <leader>, mzA,<esc>`z:delm z<cr>
nnoremap <leader>; mzA;<esc>`z:delm z<cr>
nnoremap <leader>: mzA:<esc>`z:delm z<cr>

" Don't loose selection when shifting
xnoremap <  <gv
xnoremap >  >gv

" Select only the text in the current line.
nnoremap vvl v_o$h

" Show undo list
let g:gundo_prefer_python3=1
nnoremap <leader>u :GundoToggle<CR>

" Edit and reload vimrc
nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vr :source $MYVIMRC<CR>

" Exit vim
nnoremap <silent><leader>qq :qall<CR>

" Write one or all open files
nnoremap <leader>fs :write<CR>
nnoremap <leader>fS :wall<CR>
nnoremap <leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

" LocalVIMRC
let g:localvimrc_persistent=1

" Highlight all non ascii characters
syntax match nonascii "[^\x00-\xFF]"
highlight nonascii guibg=Red ctermbg=2

" Find any non ascii character
nnoremap <leader>na /[^\x00-\xFF]<CR>

" When the file changes in disk, read it automatically
set autoread

"}}}

" Git {{{

augroup git_commits
  autocmd!

  " Add spell check to git commits
  autocmd FileType gitcommit setlocal spell spelllang=en_us
augroup END

" Git Shortcuts {{{
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gC :Git commit -n<CR>
nnoremap <leader>gP :Git push<CR>
nnoremap <leader>gPP :Git push --force-with-lease<CR>
nnoremap <leader>gp :Git pull<CR>
nnoremap <leader>gf :Git fetch<CR>
nnoremap <leader>gl :GV!<CR> " git log for current file
nnoremap <leader>gL :GV<CR> " git log for project
nnoremap <leader>gd :Gvdiffsplit<CR>
nnoremap <leader>gdd :Gvdiffsplit!<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gg :Git<SPACE>
"}}}

" gitgutter {{{
let g:gitgutter_diff_args = '-w'
"}}}

"}}}

" Search {{{

" Search niceties
set inccommand=split

" Remove search highlithing
nnoremap <ESC><ESC> :nohlsearch<CR>

" fzf
let $FZF_DEFAULT_COMMAND = 'rg --files'
let g:fzf_command_prefix = 'FZF'
let g:fzf_preview_window = ['up:60%', 'ctrl-/']
let default_fzf_options =  {
        \ 'window': { 'width': 0.95, 'height': 0.70 },
        \ 'options': [
          \ '--preview-window',
          \ 'up:40%',
          \ '--bind',
          \ 'alt-j:preview-half-page-down,alt-k:preview-half-page-up'
        \ ]
      \ }

" Add preview to search results with FZFRg
command! -bang -nargs=* FZFRg call fzf#vim#grep(
        \ 'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>),
        \ 1,
        \ fzf#vim#with_preview(default_fzf_options),
        \ <bang>0
      \ )

" Add preview to search results with FZFFiles
command! -bang -nargs=? -complete=dir FZFFiles call fzf#vim#files(
        \ <q-args>,
        \ fzf#vim#with_preview(default_fzf_options),
        \ <bang>0
      \ )

" Search files
nnoremap <leader>ff <cmd>Telescope find_files<cr>
" Search files on git status
nnoremap <leader>fg :FZFGFiles?<cr>
" Search buffers
nnoremap <leader>fb <cmd>Telescope buffers<cr>
" Search with ripgrep
nnoremap <leader>s :FZFRg<space>
" Search with ripgrep the word under the cursor
nnoremap \\ :FZFRg <c-r><c-w><cr>
nnoremap <leader>sc :%s//&/n<cr>

" Far

let g:far#source = 'rg'
let g:far#window_layout = 'tab'

"}}}

" Windows & tabs {{{

" Move between windows
nnoremap <silent><leader>wj :wincmd j<CR>
nnoremap <silent><leader>wk :wincmd k<CR>
nnoremap <silent><leader>wl :wincmd l<CR>
nnoremap <silent><leader>wh :wincmd h<CR>
nnoremap <silent><C-J> :wincmd j<CR>
nnoremap <silent><C-K> :wincmd k<CR>
nnoremap <silent><C-H> :wincmd h<CR>
nnoremap <silent><C-L> :wincmd l<CR>

" Move windows around
nnoremap <silent><leader>wJ :wincmd J<CR>
nnoremap <silent><leader>wK :wincmd K<CR>
nnoremap <silent><leader>wL :wincmd L<CR>
nnoremap <silent><leader>wH :wincmd H<CR>

" Split screens
nnoremap <silent><leader>wv :wincmd v<CR>
nnoremap <silent><leader>ws :wincmd s<CR>

" Close window
nnoremap <silent><leader>cc :wincmd c<CR>

" quick list and location list
nnoremap <silent><leader>qo :copen<CR>
nnoremap <silent><leader>qc :cclose<CR>

nnoremap <silent><leader>lo :lopen<CR>
nnoremap <silent><leader>lc :lclose<CR>

" Tabs management
nnoremap <silent><leader>Tc :tabclose<CR>
" Current buffer on a new tab
nnoremap <silent><leader>TT :tabnew %<CR>

" New empty tab
nnoremap <silent><leader>T :tabnew<CR>

" next/prev tab
nnoremap <leader><TAB> gt
nnoremap <leader><S-TAB> gT
"}}}

" File navigation {{{
let g:NERDTreeHijackNetrw=1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore=[
      \ '_build$[[dir]]',
      \ 'deps$[[dir]]',
      \ 'node_modules$[[dir]]',
      \ 'tags$[[file]]',
      \ 'mix.lock$[[file]]',
      \ '\.scss\.d\.ts$[[file]]'
      \ ]

nnoremap <silent><leader><leader>f :NERDTreeToggle<CR>
nnoremap <silent><leader><leader>ff :NERDTreeFind<CR>

" configuration for netrw
let g:netrw_liststyle= 3
"}}}

" Neoterm {{{
let g:neoterm_default_mod='botright'
let g:neoterm_autoinsert=1

" Use a count to toggle a different terminal. E.g. 1tt will toggle the first
" one, while 2<leader>tt will toggle the second one.
nnoremap <leader><ESC> :<C-U>exec v:count.'Ttoggle resize=40'<CR>
nnoremap <leader><leader><ESC> :<C-U>exec v:count.'Tclear'<cr>
tnoremap <leader><leader><ESC> <C-\><C-N>:<C-U>exec v:count.'Tclear'<cr>A
tnoremap <leader><ESC> <C-\><C-N>:<C-U>exec v:count.'Ttoggle resize=40'<CR>
" <ESC><ESC> will get into normal mode and toggle-off the terminal
tnoremap <ESC><ESC> <C-\><C-N>

" }}}

" Tests {{{

" test-vim
let test#strategy='neoterm'
let test#runner_commands = ['RSpec', 'Jest']

nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tl :TestNearest<CR>
nnoremap <leader>tr :TestLast<CR>
nnoremap <leader>ts :TestSuite<CR>
"}}}

" Autocomplete {{{

" Ultisnips
let g:UltiSnipsSnippetsDir = $HOME.'/.config/nvim/snips'
let g:UltiSnipsSnippetDirectories = ['snips', 'priv_snips', 'UltiSnips' ]
let g:UltiSnipsEditSplit = 'vertical'

set completefunc=dot#ListSnippets

augroup files_autocomplete
  autocmd!

  " Improve autocomplete for relative files
  autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
  autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
augroup END

" Language Server

" Backup files {{{
set backup
set backupdir   =$HOME/.config/nvim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.config/nvim/files/swap/
set updatecount =100
set updatetime  =300
set undofile
set undodir     =$HOME/.config/nvim/files/undo/
set viminfo     ='100,n$HOME/.config/nvim/files/info/viminfo
set viewdir     =$HOME/.config/nvim/files/view
"}}}

"}}}

let g:ruby_indent_block_style = 'do'
let test#ruby#rspec#executable = 'bin/spring rspec'

augroup ruby
  autocmd!

  " Rails schema.rb file can be a pain to open.
  autocmd BufRead db/schema.rb setlocal ft=off
augroup END

call lexima#add_rule({
      \   'at': '\%#',
      \   'char': '{',
      \   'input': '{<Space>',
      \   'input_after': '<Space>}',
      \   'filetype': ['ruby'],
      \ })

call lexima#add_rule({
      \   'at': '\%#',
      \   'char': '#',
      \   'input': '#{',
      \   'input_after': '}',
      \   'filetype': ['ruby', 'elixir'],
      \   'syntax': ['rubyString', 'rubyStringDelimiter',
      \              'elixirString', 'elixirStringDelimiter'],
      \ })

call lexima#add_rule({
      \   'at': '\%#',
      \   'char': '$',
      \   'input': '${',
      \   'input_after': '}',
      \   'filetype': ['javascript', 'typescript'],
      \   'syntax': ['sqlTemplateString', 'typescriptTemplate'],
      \ })

call lexima#add_rule({
      \   'at': '\({\|\<do\>\)\s*\%#',
      \   'except': '\(|\)\%#\(|\)',
      \   'char': '<Bar>',
      \   'input': '<Bar>',
      \   'input_after': '<Bar>',
      \   'filetype': ['ruby'],
      \ })
"
call lexima#add_rule({'char': '<BS>', 'at': '|\%#|', 'delete': 1})
"}}}

" YAML {{{
augroup yaml
  autocmd!

  autocmd FileType yaml setlocal foldmethod=indent
  autocmd FileType yaml setlocal foldenable
augroup END
" }}}

nnoremap N Nzz
nnoremap n nzz

" }}}

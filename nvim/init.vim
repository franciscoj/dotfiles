" vim: fdm=marker fmr={{{,}}} fdl=0 fen

set encoding=utf-8 " default character encoding

" Set leader keys before anything else
let mapleader      = ' '
let maplocalleader = ','

" Get the OS name so that we can do some silly OS only stuff with it.
let os = substitute(system('uname'), "\n", '', '')

filetype off

" Plugins install {{{
call plug#begin()

" Thank to the universe for Tim Pope {{{
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch' " Syntax sugar for unix commands
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-characterize'
Plug 'junegunn/vim-peekaboo'
"}}}

" Misc {{{
Plug 'kana/vim-smartinput' " To have automatic closed pairs like () or {}
Plug 'vim-airline/vim-airline'
Plug 'sjl/gundo.vim'
Plug 'FooSoft/vim-argwrap'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'scrooloose/nerdtree'
Plug 'embear/vim-localvimrc'
Plug 'wellle/targets.vim'
Plug 'sirver/ultisnips'
Plug 'powerman/vim-plugin-AnsiEsc'
"}}}

" Git {{{
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'
"}}}

" Language support {{{
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'noprompt/vim-yardoc'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'neoclide/jsonc.vim'
Plug 'rust-lang/rust.vim'
Plug 'aklt/plantuml-syntax'
Plug 'junegunn/vader.vim'
Plug 'fatih/vim-go' " , { 'do': ':GoUpdateBinaries' }
Plug 'sheerun/vim-polyglot'

Plug 'dense-analysis/ale'
Plug 'janko-m/vim-test'
Plug 'scrooloose/vim-slumlord'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'amiralies/coc-flow', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
"}}}

" Search {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'brooth/far.vim'
Plug 'romainl/vim-qf'
"}}}

" Look & Feel {{{
Plug 'rakr/vim-one'
Plug 'ryanoasis/vim-devicons'
Plug 'camspiers/lens.vim'
"}}}

" Others {{{
" Adds auto commands on syntax changes. To be able to activate/deactivate auto
" wrap on comments
Plug 'inkarkat/vim-OnSyntaxChange'
Plug 'inkarkat/vim-ingo-library'
" }}}

call plug#end()
" }}}

" Config {{{

" Misc {{{

set relativenumber
set modeline

" Toggle word wrap
set nowrap
nnoremap <leader>ww :set wrap!<CR>

" Go to Normal mode fast
inoremap jj <ESC>
inoremap <ESC> <NOP>

" Colorscheme
" let base16colorspace=256

set background=dark
set termguicolors
colorscheme one

" Better color on tmux
set t_8b=[48;2;%lu;%lu;%lum
set t_8f=[38;2;%lu;%lu;%lum

" Autoresize
let g:lens#disabled_filetypes = ['nerdtree', 'fzf']
let g:lens#width_resize_min = 5

" Show non visual chars
set listchars=trail:~,tab:\|-,eol:< " show special characters
set list

" To use the system clipboard (xclip)
set clipboard=unnamed,unnamedplus

" Folding
set foldmethod=syntax
set nofoldenable

" Show undo list
nnoremap <leader>u :GundoToggle<CR>

" Edit and reload vimrc
nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vr :source $MYVIMRC<CR>

" Exit vim
nnoremap <silent><leader>qq :qall<CR>

" Write one or all open files
nnoremap <leader>fs :write<CR>
nnoremap <leader>fS :wall<CR>
nnoremap <leader>fo :edit<space>
nnoremap <leader>e :e <C-R>=expand('%:p:h') . '/'<CR>


" Load QF list
nnoremap <leader>ll :LoadList<space>
nnoremap <leader>ls :SaveList<space>
nnoremap <leader>lr :Reject<CR>

" LocalVIMRC
let g:localvimrc_persistent=1

" Highlight all non ascii characters
syntax match nonascii "[^\x00-\xFF]"
highlight nonascii guibg=Red ctermbg=2

" Find any non ascii character
nnoremap <leader>na /[^\x00-\xFF]<CR>
"}}}

" Edit {{{

" Indention
set tabstop=2      " number of visual spaces per TAB.
set shiftwidth=2   " number of spaces to use for each step of (auto)indent.
set softtabstop=2  " number of spaces in tab when editing.
set shiftround     " round indent to multiple of 'shiftwidth'
set expandtab      " tabs are spaces
set smarttab
set autoindent
set copyindent
set smartindent

" Best options for changing text
set cpoptions+=$

" ArgWrap
nnoremap <silent><leader>a :ArgWrap<CR>

" split-join
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0

" Yank list
nnoremap <silent><space>y  :<C-u>CocList -A --normal yank<cr>

" Others
" Add characters to the end of the line and go back to the expot in which you
" were.
nnoremap <leader>, mzA,<esc>`z
nnoremap <leader>; mzA;<esc>`z
nnoremap <leader>: mzA:<esc>`z

" Don't loose selection when shifting
xnoremap <  <gv
xnoremap >  >gv

" When entering comments, activate text wrap automatically and deactivate it
" when leaving them.
call OnSyntaxChange#Install('Comment', '^Comment$', 0, 'i')

augroup auto_wrap_comments
  autocmd User SyntaxCommentEnterI setlocal tw=79
  autocmd User SyntaxCommentLeaveI setlocal tw=0
augroup END

"}}}

" Git {{{

augroup git_commits
  autocmd!

  " Add spell check to git commits
  autocmd FileType gitcommit setlocal spell spelllang=en_us
augroup END


" Shortcuts
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gC :Gcommit -n<CR>
nnoremap <leader>gP :Gpush<CR>
nnoremap <leader>gfP :Gpush --force-with-lease<CR>
nnoremap <leader>gp :Gpull<CR>
nnoremap <leader>gf :Gfetch<CR>
" git log for current file
nnoremap <leader>gl :GV!<CR>
" git log for project
nnoremap <leader>gL :GV<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gm :Git checkout master<CR>
nnoremap <leader>g- :Git checkout -<CR>
nnoremap <leader>grm :Grebase -i master<CR>


" signify (gutter for git)
let g:signify_vcs_list = ['git']
let g:signify_sign_change = '~'
let g:signify_sign_changedelete = '!'
let g:signify_realtime = 1

"}}}

" Search {{{

" Search niceties
set inccommand=split

" Remove search highlithing
nnoremap <ESC><ESC> :nohlsearch<CR>

" fzf
let $FZF_DEFAULT_COMMAND = 'rg --files'
let g:fzf_command_prefix = 'FZF'
let g:fzf_layout = { 'down': '~60%' }

" Add preview to search results with FZFRg
command! -bang -nargs=* FZFRg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview('up'), <bang>0)

" Add preview to search results with FZFFiles
command! -bang -nargs=? -complete=dir FZFFiles
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('up'), <bang>0)

" Search files
nnoremap <leader>ff :FZFFiles<cr>
" Search files on git status
nnoremap <leader>fg :FZFGFiles?<cr>
" Search buffers
nnoremap <leader>fb :FZFBuffers<cr>
" Search with ripgrep
nnoremap <leader>s :FZFRg<space>
" Search with ripgrep the word under the cursor
nnoremap \\ :FZFRg <c-r><c-w><cr>

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
nnoremap <silent><leader><leader>t :tabnew<CR>
nnoremap <silent><leader><leader>tc :tabclose<CR>
nnoremap <silent><leader><leader>T :tabnew %<CR>
nnoremap <leader><TAB> gt
nnoremap <leader><S-TAB> gT
"}}}

" File navigation {{{
let g:NERDTreeHijackNetrw=1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore=[
      \ '_build$[[dir]]',
      \ 'doc$[[dir]]',
      \ 'deps$[[dir]]',
      \ 'node_modules$[[dir]]',
      \ 'tags$[[file]]',
      \ 'mix.lock$[[file]]',
      \ '\.bs\.js$[[file]]',
      \ '\.scss\.d\.ts$[[file]]'
      \ ]

nnoremap <silent><leader><leader>f :NERDTreeToggle<CR>
nnoremap <silent><leader><leader>ff :NERDTreeFind<CR>

" configuration for netrw
let g:netrw_liststyle= 3
"}}}

" Linting {{{

" ALE - Asynchronous Linting Engine
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1

let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

let g:ale_linters = {
      \ 'elixir': ['mix', 'credo'],
      \ 'javascript': [],
      \ 'python': ['flake8'],
      \ 'ruby': ['rubocop', 'ruby'],
      \ 'rust': ['cargo']
      \}

let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'elixir': ['mix_format'],
      \ 'javascript': ['prettier'],
      \ 'ruby': ['rubocop'],
      \ 'rust': ['rustfmt'],
      \ 'typescript': ['prettier']
      \}

nnoremap <silent><leader>lf :ALEFix<CR>
nnoremap <silent><leader>ld :ALEDetail<CR>
"}}}

" Tests {{{

" test-vim
let test#strategy='dispatch'
let test#runner_commands = ['RSpec', 'Jest']

nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tl :TestNearest<CR>
nnoremap <leader>tr :TestLast<CR>
nnoremap <leader>to :Copen<CR>
"}}}

" Autocomplete {{{

" Ultisnips
let g:UltiSnipsSnippetsDir = $HOME.'/.config/nvim/snips'
let g:UltiSnipsSnippetDirectories = ['snips', 'priv_snips', 'UltiSnips' ]
let g:UltiSnipsEditSplit = 'vertical'

set completefunc=functions#ListSnippets
set completeopt=menuone

augroup files_autocomplete
  autocmd!

  " Improve autocomplete for relative files
  autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
  autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
augroup END

" Language Server
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

nmap <leader>Lo :<C-u>CocList diagnostics<cr>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>Ld <Plug>(coc-diagnostics-info)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>showDocumentation()<CR>

function! s:showDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Status line {{{
let g:airline#extensions#ale#enabled = 1

let g:airline_theme='one'

" Don't display encoding unless it is unexpected
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" Use abbreviations to display modes
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

" Disable showing git hunks
let g:airline#extensions#hunks#enabled = 0

let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr'])
"}}}

" Backup files {{{
set backup
set backupdir   =$HOME/.config/nvim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.config/nvim/files/swap/
set updatecount =100
set undofile
set undodir     =$HOME/.config/nvim/files/undo/
set viminfo     ='100,n$HOME/.config/nvim/files/info/viminfo
set viewdir     =$HOME/.config/nvim/files/view
"}}}

"}}}

" Language specific {{{

" Disable polyglot in favor of real language packs
"
" Polyglot is great but it doesn't activate all the functionalities for all
" languages in order to make it load fast.
let g:polyglot_disabled = [ 'go', 'javascript', 'jsx', 'markdown', 'ruby', ]

" Markdown {{{
let g:vim_markdown_folding_level = 2

augroup markdown
  autocmd!
  autocmd FileType markdown setlocal textwidth=79
  autocmd FileType markdown setlocal spell spelllang=en_us
  autocmd FileType markdown setlocal noshiftround
augroup END
"}}}

" Ruby {{{
let g:ruby_indent_block_style = 'do'
let test#ruby#rspec#executable = 'bin/spring rspec'

augroup ruby
  autocmd!

  " Rails schema.rb file can be a pain to open.
  autocmd BufRead schema.rb setlocal ft=off
augroup END
"}}}

" HAML {{{
augroup haml
  autocmd!

  autocmd FileType haml setlocal foldmethod=indent
augroup END
"}}}

" YAML {{{
augroup yaml
  autocmd!

  autocmd FileType yaml setlocal foldmethod=indent
  autocmd FileType yaml setlocal foldenable
augroup END
" }}}

" Elixir {{{

" ALE config
let g:ale_elixir_elixir_ls_release='/opt/elixir-ls'
let g:ale_elixir_elixir_ls_config= {
    \   'elixirLS': {
    \     'dialyzerEnabled': v:false,
    \   },
    \ }

augroup elixir
  autocmd!
  autocmd FileType elixir setlocal formatprg=
  autocmd FileType elixir setlocal foldmethod=indent
augroup END
"}}}

" JavaScript & TypeScript {{{
let g:vim_jsx_pretty_colorful_config = 1
" }}}

" JSON {{{
augroup json_configs
  autocmd!

  autocmd BufNewFile,BufRead .lintstagedrc set syntax=json
  autocmd BufNewFile,BufRead .eslintrc set syntax=json
augroup END

augroup snippets
  autocmd!

  autocmd FileType javascriptreact :call UltiSnips#AddFiletypes('javascript')
augroup END
" }}}
"
" Bash {{{
augroup bash_configs
  autocmd!

  autocmd BufNewFile,BufRead .envrc set syntax=sh
augroup END
" }}}

" Golang {{{
let g:go_version_warning = 0
" }}}

"}}}

" Load custom functions
source $HOME/.config/nvim/functions.vim

" }}}

" vim: fdm=marker fmr={{{,}}} fdl=0 fen

set encoding=utf-8 " default character encoding
scriptencoding utf-8

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
Plug 'junegunn/goyo.vim'
"}}}

" Misc {{{
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

" Improved text objects
Plug 'wellle/targets.vim'

" Split arguments, blocks, etc...
Plug 'FooSoft/vim-argwrap'
Plug 'AndrewRadev/splitjoin.vim'

" Show marks on the gutter
Plug 'kshenoy/vim-signature'

" Adds auto commands on syntax changes. To be able to activate/deactivate auto
" wrap on comments.
Plug 'inkarkat/vim-OnSyntaxChange'
Plug 'inkarkat/vim-ingo-library'

" Adds a UI for the database.
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'tpope/vim-dadbod'
"}}}

" Git {{{
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

" Allows to manage git branches
Plug 'sodapopcan/vim-twiggy'

let g:git_messenger_no_default_mappings=v:true
Plug 'rhysd/git-messenger.vim'
"}}}

" Language support {{{

" FIXME: Find a better way to load this.
" Disable polyglot in favor of real language packs
"
" Polyglot is great but it doesn't activate all the functionalities for all
" languages in order to make it load fast.
let g:polyglot_disabled = [
      \ 'eelixir',
      \ 'elixir',
      \ 'git',
      \ 'javascript',
      \ 'jsx',
      \ 'markdown',
      \ 'plantuml',
      \ 'ruby',
      \ 'rust',
      \ 'typescript',
      \ 'yard'
      \ ]
Plug 'sheerun/vim-polyglot'

Plug 'plasticboy/vim-markdown'

" JavaScript
Plug 'yuezk/vim-js'
Plug 'MaxMEllon/vim-jsx-pretty'

" TypeScript
Plug 'HerringtonDarkholme/yats.vim'

" Ruby
Plug 'noprompt/vim-yardoc'
Plug 'vim-ruby/vim-ruby'
Plug 'neoclide/jsonc.vim'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/vader.vim'
Plug 'aklt/plantuml-syntax'
Plug 'scrooloose/vim-slumlord'
Plug 'elixir-editors/vim-elixir'
"}}}

" Search {{{
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Find and Replace
Plug 'brooth/far.vim'

" Quicklist management
Plug 'romainl/vim-qf'
"}}}

" Look & Feel {{{
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'

" Focus mode
Plug 'junegunn/goyo.vim'
"}}}

" Linting, autocomplete, etc... {{{
" Only linting and fixing
Plug 'dense-analysis/ale'

" LSP support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'janko-m/vim-test'
"}}}

" Testing... {{{
" Fern, a different project navigation and file manager than nerdtree
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'wellle/targets.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'AndrewRadev/sideways.vim'

nnoremap <leader><leader>h :SidewaysLeft<cr>
nnoremap <leader><leader>l :SidewaysRight<cr>
nnoremap <leader>h :SidewaysJumpLeft<cr>
nnoremap <leader>l :SidewaysJumpRight<cr>

let g:fern#renderer = 'nerdfont'

augroup tree-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree call glyph_palette#apply()
augroup END
"}}}

call plug#end()
"}}}

" Config {{{

" Look & Feel {{{

" Show both current linen number and relative number
set relativenumber
set number
set signcolumn=auto:3

" Gruvbox colrscheme setup {{{
set background=dark
set termguicolors
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_italic=1
let g:gruvbox_italicize_strings=1
let g:gruvbox_invert_selection=0
let g:airline_theme='gruvbox'
let g:gruvbox_guisp_fallback='fg'
colorscheme gruvbox
" Better color on tmux
set t_8b=[48;2;%lu;%lu;%lum
set t_8f=[38;2;%lu;%lu;%lum
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

" Disable showing git hunks
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#nerdtree_statusline = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr'])

"}}}

" Show non visual chars
set listchars=trail:~,tab:\|-,eol:¬ " show special characters
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
nnoremap <leader>, mzA,<esc>`z:delm z<cr>
nnoremap <leader>; mzA;<esc>`z:delm z<cr>
nnoremap <leader>: mzA:<esc>`z:delm z<cr>

" Don't loose selection when shifting
xnoremap <  <gv
xnoremap >  >gv

" Select current line, only
nnoremap vvl v_o$h

" When entering comments, activate text wrap automatically and deactivate it
" when leaving them.
"
" Comments break line {{{
call OnSyntaxChange#Install('Comment', '^Comment$', 1, 'i')

augroup auto_wrap_comments
  autocmd User SyntaxCommentEnterI setlocal tw=79
  autocmd User SyntaxCommentLeaveI setlocal tw=0
augroup END
"}}}

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

" git-messenger {{{
let g:git_messenger_include_diff='current'
let g:git_messenger_always_into_popup=v:true
nnoremap <leader>gM :GitMessenger<CR>
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
nnoremap <silent><leader>TT :tabnew %<CR>
nnoremap <silent><leader>T :tabnew<CR>
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

" Linting {{{

" ALE - Asynchronous Linting Engine
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
let g:ale_disable_lsp = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

let g:ale_linters = {
      \ 'elixir': ['mix'],
      \ 'javascript': [],
      \ 'python': ['flake8'],
      \ 'ruby': ['rubocop', 'ruby'],
      \ 'rust': ['analyzer']
      \}

let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'elixir': ['mix_format'],
      \ 'javascript': ['prettier'],
      \ 'ruby': ['rubocop'],
      \ 'rust': [],
      \ 'typescript': ['prettier'],
      \ 'typescriptreact': ['prettier']
      \}

nnoremap <silent><leader>lf :ALEFix<CR>
nnoremap <silent><leader>ld :ALEDetail<CR>
"}}}

" Neoterm {{{
let g:neoterm_default_mod='botright'
nnoremap <leader>tt :<c-u>exec v:count.'Ttoggle resize=40'<CR>
nnoremap <leader>tcl :<c-u>exec v:count.'Tclear'<cr>

" }}}

" Tests {{{

" test-vim
let test#strategy='neoterm'
let test#runner_commands = ['RSpec', 'Jest']

nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tl :TestNearest<CR>
nnoremap <leader>tr :TestLast<CR>
"}}}

" Autocomplete {{{

" Ultisnips
let g:UltiSnipsSnippetsDir = $HOME.'/.config/nvim/snips'
let g:UltiSnipsSnippetDirectories = ['snips', 'priv_snips', 'UltiSnips' ]
let g:UltiSnipsEditSplit = 'vertical'

set completefunc=dot#ListSnippets
set completeopt=menuone

augroup files_autocomplete
  autocmd!

  " Improve autocomplete for relative files
  autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
  autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
augroup END

" " Deoplete
" let g:deoplete#enable_at_startup = 1

" call deoplete#custom#option('sources', {
"       \ '_': ['ultisnips'],
"       \})
" call deoplete#custom#option('auto_complete_delay', 100)

" Language Server
let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-solargraph',
      \ 'coc-elixir',
      \ 'coc-flow',
      \ 'coc-vimlsp',
      \ 'coc-jedi',
      \ 'coc-tailwindcss'
      \ ]

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . ' ' . expand('<cword>')
  endif
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

set shortmess+=c


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

" Language specific {{{

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
let g:ale_elixir_elixir_ls_release=$HOME.'/Documents/src/elixir-ls-release'
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

augroup js_snippets
  autocmd!

  autocmd FileType javascriptreact :call UltiSnips#AddFiletypes('javascript')
augroup END
" }}}

" JSON {{{
augroup json_configs
  autocmd!

  autocmd BufNewFile,BufRead .lintstagedrc set syntax=json
  autocmd BufNewFile,BufRead .eslintrc set syntax=json
augroup END
" }}}
"
" Bash {{{
augroup bash_configs
  autocmd!

  autocmd BufNewFile,BufRead .envrc set syntax=sh
augroup END
" }}}

" Rust {{{
augroup rust_configs
  autocmd!

  autocmd FileType rust xmap <leader>lf  :RustFmtRange<CR>
  autocmd FileType rust nmap <leader>lf  :RustFmt<CR>
augroup END
" }}}

"}}}

" plantuml {{{
augroup plantuml_configs
  autocmd!
  autocmd Filetype foo setlocal makeprg=plantuml %
augroup END
"}}}

" }}}

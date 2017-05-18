" To use the system clipboard (xclip)
set clipboard=unnamed,unnamedplus

set background=dark
colorscheme zenburn

" Indent
set tabstop=2      " number of visual spaces per TAB.
set shiftwidth=2   " number of spaces to use for each step of (auto)indent.
set softtabstop=2  " number of spaces in tab when editing.
set shiftround     " round indent to multiple of 'shiftwidth'
set expandtab      " tabs are spaces
set smarttab
set autoindent
set copyindent
set smartindent
set colorcolumn=80

" Show non visual chars
set listchars=trail:~,tab:▸\ ,eol:¬ " show special characters
set list

" Search niceties
set inccommand=split

" configuration for netrw
let g:netrw_liststyle= 3

" Make text width 80 chars long on markdown files
autocmd FileType markdown call SetMarkdownOptions()

" If overwrite the SetMarkDownOptions function if it exists
function! SetMarkdownOptions()
  setlocal textwidth=79
  setlocal spell spelllang=en_us
  setlocal noshiftround
endfunction

" Add spell check to git commits
autocmd FileType gitcommit setlocal spell spelllang=en_us

" Improve the files autocomplete
autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)

" Folding
set foldmethod=syntax
set nofoldenable

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

" Show non visual chars
set listchars=trail:~,tab:▸\ ,eol:¬ " show special characters
set list

" Search niceties
set inccommand=split

" config for netrw
let g:netrw_liststyle= 3

" Make textwidth 80 chars long on markdown files
au BufRead,BufNewFile *.md setlocal textwidth=80

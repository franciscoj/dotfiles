" Go to Normal mode fast
imap jj <ESC>

" fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>

" fzf
nnoremap <leader>ff :FZFFiles<cr>
nnoremap <leader>fb :FZFBuffers<cr>
nnoremap <leader>ft :FZFTags<cr>
nnoremap <leader>fh :FZFHistory<cr>

" grepper
nnoremap \ :Grepper -query<space>
" bind K to grep word under cursor
nnoremap \\ :Grepper -noprompt -cword<CR> 
nnoremap <leader>s :Grepper<CR>

" test-vim
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tl :TestNearest<CR>
nnoremap <leader>tt :TestVisit<CR>

" Show tagbar
nnoremap <leader><leader>t :TagbarToggle<CR>

" Show undo list
nnoremap <leader>u :GundoToggle<CR>

" Edit and reload vimrc
nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vr :source $MYVIMRC<CR>

" Window move around
nnoremap <silent><C-j> :wincmd j<CR>
nnoremap <silent><C-k> :wincmd k<CR>
nnoremap <silent><C-l> :wincmd l<CR>
nnoremap <silent><C-h> :wincmd h<CR>

" quick list and location list
nnoremap <leader>qo :copen<CR>
nnoremap <leader>lo :lopen<CR>

nnoremap <leader>qc :cclose<CR>
nnoremap <leader>lc :lclose<CR>

" Close windows and exit vim
nnoremap <silent><leader>cc :wincmd c<CR>
nnoremap <silent><leader>qq :qall<CR>

" Remove search highlithing
nnoremap <silent><leader>nh :nohlsearch<CR>

nnoremap <leader>fs :write<CR>
nnoremap <leader>fS :wall<CR>

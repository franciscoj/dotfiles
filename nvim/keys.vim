" Go to Normal mode fast
inoremap jj <ESC>
inoremap <ESC> <NOP>

" fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>

" fzf
nnoremap <leader>ff :FZFGFiles<cr>
nnoremap <leader>fb :FZFBuffers<cr>
nnoremap <leader>ft :FZFBTags<cr>
nnoremap <leader>fh :FZFHistory<cr>

" grepper
nnoremap \\ :Grepper -noprompt -cword<CR> 
nnoremap <leader>s :Grepper -query<SPACE>

" test-vim
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tl :TestNearest<CR>
nnoremap <leader>tr :TestLast<CR>
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

" Close window
nnoremap <silent><leader>cc :wincmd c<CR>
" Exit vim
nnoremap <silent><leader>qq :qall<CR>

" Remove search highlithing
nnoremap <silent><leader>nh :nohlsearch<CR>

" Write one or all open files
nnoremap <leader>fs :write<CR>
nnoremap <leader>fS :wall<CR>

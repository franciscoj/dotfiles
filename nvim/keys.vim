" Go to Normal mode fast
inoremap jj <ESC>
inoremap <ESC> <NOP>

" fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>

" scout
nnoremap <leader>ff :ScoutFiles<cr>
nnoremap <leader>fb :ScoutBuffers<cr>

" grepper
nnoremap \\ :Grepper -noprompt -cword<CR> 
nnoremap <leader>s :Grepper -query<SPACE>

" test-vim
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tl :TestNearest<CR>
nnoremap <leader>tr :TestLast<CR>
nnoremap <leader>tt :TestVisit<CR>

" Show undo list
nnoremap <leader>u :GundoToggle<CR>

" Edit and reload vimrc
nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vr :source $MYVIMRC<CR>

" Move between windows
nnoremap <silent><leader>j :wincmd j<CR>
nnoremap <silent><leader>k :wincmd k<CR>
nnoremap <silent><leader>l :wincmd l<CR>
nnoremap <silent><leader>h :wincmd h<CR>

" Move windows around
nnoremap <silent><leader><leader>j :wincmd J<CR>
nnoremap <silent><leader><leader>k :wincmd K<CR>
nnoremap <silent><leader><leader>l :wincmd L<CR>
nnoremap <silent><leader><leader>h :wincmd H<CR>

" Split screens
nnoremap <silent><leader><leader>v :wincmd v<CR>
nnoremap <silent><leader><leader>s :wincmd s<CR>

" quick list and location list
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qc :cclose<CR>

nnoremap <leader>lc :lclose<CR>
nnoremap <leader>lo :lopen<CR>

" Close window
nnoremap <silent><leader>cc :wincmd c<CR>
" Exit vim
nnoremap <silent><leader>qq :qall<CR>

" Remove search highlithing
nnoremap <silent><leader>nh :nohlsearch<CR>

" Write one or all open files
nnoremap <leader>fs :write<CR>
nnoremap <leader>fS :wall<CR>
nnoremap <leader>fo :edit<space> 

" ArgWrap
nnoremap <silent> <leader>a :ArgWrap<CR>

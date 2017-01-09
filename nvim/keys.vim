" Go to Normal mode fast
imap jj <ESC>

" quick list and location list
map <leader>qo :copen<CR>
map <leader>lo :lopen<CR>

map <leader>qc :cclose<CR>
map <leader>lc :lclose<CR>

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

" neoterm
nmap <leader>rs :call neoterm#test#run("file")<cr>
nmap <leader>rl :call neoterm#test#run("current")<cr>

" Show tagbar
nmap <leader>tt :TagbarToggle<CR>

" Show undo list
nmap <leader>u :GundoToggle<CR>

" Edit and reload vimrc
nmap <leader>ve :edit $MYVIMRC<CR>
nmap <leader>vr :source $MYVIMRC<CR>

" Window move around
nmap <silent><C-j> :wincmd j<CR>
nmap <silent><C-k> :wincmd k<CR>
nmap <silent><C-l> :wincmd l<CR>
nmap <silent><C-h> :wincmd h<CR>
nmap <silent><leader>cc :wincmd c<CR>
nmap <silent><leader>qq :qa<CR>

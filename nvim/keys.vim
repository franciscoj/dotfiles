autocmd FileType reason call SetReasonMLOptions()

function! SetReasonMLOptions()
  nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
endfunction

" ALE
nmap <leader>lf <Plug>(ale_fix)
nmap <leader>ld <Plug>(ale_detail)

" Go to Normal mode fast
inoremap jj <ESC>
inoremap <ESC> <NOP>

" fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gg :Twiggy<CR>

" fzf
command! -bang -nargs=* FZFFind call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
let g:fzf_command_prefix = 'FZF'

nnoremap <leader>ff :FZFFiles<cr>
nnoremap <leader>fb :FZFBuffers<cr>

" grepper
nnoremap \\ :Grepper -noprompt -cword<CR> 
nnoremap <leader>s :Grepper -query<SPACE>

" test-vim
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tl :TestNearest<CR>
nnoremap <leader>tr :TestLast<CR>
nnoremap <leader>to :Copen<CR>

" Show undo list
nnoremap <leader>u :GundoToggle<CR>

" Edit and reload vimrc
nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vr :source $MYVIMRC<CR>

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

" quick list and location list
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qc :cclose<CR>

nnoremap <leader>lo :lopen<CR>
nnoremap <leader>lc :lclose<CR>

" Tabs management
nnoremap <leader><leader>t :tabnew<CR>
nnoremap <leader><TAB> gt
nnoremap <leader><S-TAB> gT

" Close window
nnoremap <silent><leader>cc :wincmd c<CR>
" Exit vim
nnoremap <silent><leader>qq :qall<CR>
" Source session
nnoremap <silent><leader>ss :source Session.vim<CR>

" Remove search highlithing
nnoremap <silent><leader>nh :nohlsearch<CR>

" Write one or all open files
nnoremap <leader>fs :write<CR>
nnoremap <leader>fS :wall<CR>
nnoremap <leader>fo :edit<space> 

" ArgWrap
nnoremap <silent> <leader>a :ArgWrap<CR>

" Others
nnoremap <leader>, A,<ESC>
nnoremap <leader>; A;<ESC>

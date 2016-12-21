" FZF
if executable('fzf')
  let g:fzf_command_prefix = 'FZF'
  nnoremap <leader>ff :FZFFiles<cr>
  nnoremap <leader>fb :FZFBuffers<cr>
  nnoremap <leader>ft :FZFTags<cr>
  nnoremap <leader>fh :FZFHistory<cr>
endif

" FZF
if executable('fzf')
  let g:fzf_command_prefix = 'FZF'
  nnoremap <leader>ff :FZFFiles<cr>
  nnoremap <leader>fb :FZFBuffers<cr>
  nnoremap <leader>ft :FZFTags<cr>
  nnoremap <leader>fh :FZFHistory<cr>

  nnoremap \ :FZFAg<space>
  " TODO: This doesn't work for me, investigate
  " bind K to grep word under cursor with ag
  " nnoremap K :FZFAg <C-R><C-W><cr>:cw<cr>
endif

nnoremap <leader>fe :Explore<cr>

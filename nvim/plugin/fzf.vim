" FZF
if executable('fzf')
  let g:fzf_command_prefix = 'FZF'
  nnoremap <leader>ff :FZFFiles<cr>
  nnoremap <leader>fb :FZFBuffers<cr>
  nnoremap <leader>ft :FZFTags<cr>
  nnoremap <leader>fh :FZFHistory<cr>

  " @link https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2#.nmibqk5oe
  if executable('rg')
    command! -bang -nargs=* FZFRg call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
    nnoremap \ :FZFRg<space>
    " bind K to grep word under cursor with rg
    nnoremap K :FZFRg <C-R><C-W><cr>:cw<cr>
  elseif executable('ag')
    nnoremap \ :FZFAg<space>
    " bind K to grep word under cursor with ag
    nnoremap K :FZFAg <C-R><C-W><cr>:cw<cr>
  endif
endif

nnoremap <leader>fe :Explore<cr>

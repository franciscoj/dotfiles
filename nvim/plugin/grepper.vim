" let g:grepper = { 'tools': ['rg', 'git', 'ag'] }
nnoremap \ :Grepper -query<space>
" bind K to grep word under cursor
nnoremap K :Grepper -noprompt -cword<CR>
nnoremap <leader>s :Grepper<CR>

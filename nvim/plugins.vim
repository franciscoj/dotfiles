" deoplete
let g:deoplete#enable_at_startup = 1

" fzf
let g:fzf_command_prefix = 'FZF'

" Grepper tools preference
let g:grepper = { 'tools': ['ag', 'git'] }

" Show those languages with syntax highliting inside Markdown
let g:vim_markdown_fenced_languages = ['html', 'ruby', 'bash=sh', 'javascript', 'yaml']
let g:vim_markdown_folding_level = 2

" neoterm
let g:neoterm_size = '15%'

" Neomake
autocmd! BufReadPost,BufWritePost * Neomake
let g:neomake_open_list = 0

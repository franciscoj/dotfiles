" Show those languages with syntax highliting inside Markdown
let g:vim_markdown_fenced_languages = ['html', 'ruby', 'bash=sh', 'javascript', 'yaml']
let g:vim_markdown_folding_level = 2

" Make textwidth 80 chars long on markdown files
au BufRead,BufNewFile *.md setlocal textwidth=80


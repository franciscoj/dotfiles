" deoplete
let g:deoplete#enable_at_startup = 1

" signify (gutter for git)
let g:signify_vcs_list = ['git']

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

let g:neomake_open_list = 1
let g:neomake_list_height = 4
let g:neomake_logfile = '/tmp/neomake.log'
let g:neomake_javascript_enabled_makers = ['eslint']

let g:neomake_error_sign = {'text': 'E>', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {
      \   'text': 'W>',
      \   'texthl': 'NeomakeWarningSign',
      \ }
let g:neomake_message_sign = {
      \   'text': 'M>',
      \   'texthl': 'NeomakeMessageSign',
      \ }
let g:neomake_info_sign = {'text': 'I>', 'texthl': 'NeomakeInfoSign'}

augroup my_neomake_signs
  au!
  autocmd ColorScheme *
        \ hi NeomakeErrorSign ctermfg=red |
        \ hi NeomakeWarningSign ctermfg=yellow |
        \ hi NeomakeInfoSign ctermfg=blue |
        \ hi NeomakeMessageSign ctermfg=white
augroup END


" test-vim
let test#strategy = "dispatch"

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

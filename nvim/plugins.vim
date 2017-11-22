" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#complete_method = 'omnifunc'

" Ultisnips
let g:UltiSnipsSnippetsDir = $HOME.'/.config/nvim/snips'
let g:UltiSnipsSnippetDirectories=[ "snips", "UltiSnips" ]
let g:UltiSnipsEditSplit = "vertical"

" signify (gutter for git)
let g:signify_vcs_list = ['git']
let g:signify_sign_change = '~'
let g:signify_sign_changedelete = '!'
let g:signify_realtime = 1

" Grepper tools preference
let g:grepper = { 'tools': ['rg', 'ag', 'git'] }

" Show those languages with syntax highliting inside Markdown
let g:vim_markdown_fenced_languages = ['html', 'ruby', 'bash=sh', 'javascript', 'yaml']
let g:vim_markdown_folding_level = 2

" neoterm
let g:neoterm_size = '15%'

let g:test#strategy = "dispatch"
let g:test#runner_commands = ['RSpec']

" ALE - Asynchronous Linting Engine
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1

let g:ale_sign_error = 'E>'
let g:ale_sign_warning = 'W>'

let g:ale_linters = {
      \ 'ruby': ['rubocop', 'ruby']
      \}

let g:ale_fixers = {
      \ 'ruby': ['rubocop', 'remove_trailing_lines', 'trim_whitespace']
      \}

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" elm-vim
let g:elm_format_autosave = 1

" localvimrc
let g:localvimrc_persistent = 2

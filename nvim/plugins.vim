" Go to Normal mode fast
inoremap jj <ESC>
inoremap <ESC> <NOP>

" fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gC :Gcommit -n<CR>
nnoremap <leader>gP :Gpush<CR>
nnoremap <leader>gp :Gpull<CR>
nnoremap <leader>gf :Gfetch<CR>
" git log for current file
nnoremap <leader>gl :GV!<CR>
" git log for project
nnoremap <leader>gL :GV<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gb :Gblame<CR>

" signify (gutter for git)
let g:signify_vcs_list = ['git']
let g:signify_sign_change = '~'
let g:signify_sign_changedelete = '!'
let g:signify_realtime = 1

" FZF config
let $FZF_DEFAULT_COMMAND = 'rg --files'
let g:fzf_command_prefix = 'FZF'
nnoremap <leader>ff :FZFFiles<cr>
nnoremap <leader>fb :FZFBuffers<cr>

" grepper
let g:grepper = { 'tools': ['rg', 'ag', 'git'] }

nnoremap \\ :Grepper -noprompt -cword<CR>
nnoremap <leader>s :Grepper -query<SPACE>

" test-vim
let test#strategy="dispatch"

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

" Nerdtree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore=[
      \ '_build$[[dir]]',
      \ 'doc$[[dir]]',
      \ 'deps$[[dir]]',
      \ 'elm-stuff$[[dir]]',
      \ 'node_modules$[[dir]]',
      \ 'tags$[[file]]',
      \ 'mix.lock$[[file]]',
      \ '\.bs\.js$[[file]]',
      \ '\.css[[file]]'
      \ ]

nnoremap <silent><leader><leader>f :NERDTreeToggle<CR>
" Show those languages with syntax highliting inside Markdown
let g:vim_markdown_folding_level = 2

" vim-javascript
let g:javascript_plugin_jsdoc = 1

" Disable polyglot in favor of real language packs
" Polyglot is great but it doesn't activate all the functionalities for all
" languages in order to make it load fast.
let g:polyglot_disabled = ['markdown']

" ALE - Asynchronous Linting Engine
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1

let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

let g:ale_elm_make_use_global = 1
let g:ale_elm_format_use_global = 1

let g:ale_linters = {
      \ 'elixir': [''],
      \ 'ruby': ['rubocop', 'ruby'],
      \}

let g:ale_fixers = {
      \ 'elixir': ['mix_format', 'remove_trailing_lines', 'trim_whitespace'],
      \ 'ruby': ['rubocop', 'remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
      \}

nnoremap <silent><leader>af :ALEFix<CR>
nnoremap <silent><leader>ad :ALEDetail<CR>

" Language client
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['tcp://localhost:7658']
    \ }

autocmd FileType ruby setlocal omnifunc=LanguageClient#complete

" LocalVIMRC

let g:localvimrc_persistent=1

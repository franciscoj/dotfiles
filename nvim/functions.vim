" From https://www.youtube.com/watch?v=AoHckHMogbk&feature=emb_logo
let s:middot='·'
let s:raquo='»'
let s:small_l='ℓ'

function! functions#CustomFoldtext() abort
  let l:lines='[' . (v:foldend - v:foldstart + 1) . s:small_l . ']'
  let l:first=substitute(getline(v:foldstart), '\v *', '', '')
  let l:fold_levels_count=strlen(v:folddashes) - 1
  let l:fold_level= l:fold_levels_count . ':' . s:raquo
  return l:fold_level . ' ' . l:first . ': ' . l:lines
endfunction

" List all the snippets for `completefunc` matching the current word for
" completion with C-X C-U
function! functions#ListSnippets(findstart, base) abort
  if empty(UltiSnips#SnippetsInCurrentScope(1))
    return ''
  endif

  if a:findstart
    return FindTextToComplete(a:findstart)
  else
    return FindCompleteMatches(a:base)
  endif
endfunction

" Find the start of the text to be completed
function! FindTextToComplete(findstart) abort
  let line = getline('.')
  let start = col('.') - 1

  while start > 0 && (line[start - 1] =~ '\a')
    let start -= 1
  endwhile

  return start
endfunction

function! FindCompleteMatches(base) abort
  let complete_options = []

  for word in keys(g:current_ulti_dict_info)
    if word =~ a:base
      let menu = '[snip] '. g:current_ulti_dict_info[word]['description']
      let option = {
            \ 'word': word,
            \ 'menu': menu
            \ }

      call add(complete_options, option)
    endif
  endfor

  return complete_options
endfunction

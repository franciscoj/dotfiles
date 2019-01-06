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

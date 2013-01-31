" Vim plugins with custom functions for work with php. This plugin was not created
" for general use, and it is specially for me and Uwinart Development. If you
" need, you can use it and rewrite it for your needs
"
" Maintainer: Yurii Khmelevskii <y@uwinart.com>
" Version:    0.1 (2013-01-31)
" License:    GPL

if exists("b:did_ftplugin") || exists('g:UwinUtilsPhp')
  finish
endif

let g:UwinUtilsPhp = 1


" FUNCTION: s:TogglePhpVariable {{{
"  
" Add/remove symbol $ for word under cursor 
" 
function! g:TogglePhpVariable()
  let saved_cursor = getpos('.')
  
  let line = getline('.')
  let word = expand('<cword>')
  let current_char = line[saved_cursor[2]-1]

  if current_char == ' ' || current_char == "" 
        \ || current_char == ")" || current_char == "("
        \ || current_char == "]" || current_char == "["
        \ || current_char == "," || current_char == ";"
    exe 'normal! h'
    let word = expand('<cword>')
  else
    if strpart(line, saved_cursor[2], strlen(word)) != word
      exe 'normal! l'
    endif
  endif

  if word[0] == '$'
    exe 'normal! bx'
    let saved_cursor[2] -= 1
  else
    exe 'normal! bi$'
    let saved_cursor[2] += 1
  endif

  call setpos('.', saved_cursor)
endfunction " }}}


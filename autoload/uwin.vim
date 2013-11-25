fu! Uwin#FindCssClassDefinition()
  let css = uwin#utils#readfile(g:cssfile)

  let word = expand('<cword>')
  let vvv = match(css, '\.' . word . '\ {') - 1

  let line = substitute(css[vvv], '/\* line\ ', '', 'g')
  let line = substitute(line, '\*/', '', 'g')

  let line_parts = split(line, ',')
  let exists = get(line_parts, 1, 'NONE')

  if exists == 'NONE'
    return
  endif

  let line_parts[1] = substitute(line_parts[1], '^\s*\(.\{-}\)\s*$', '\1', '')

  execute 'tabe ' . line_parts[1]
  execute line_parts[0]
endf

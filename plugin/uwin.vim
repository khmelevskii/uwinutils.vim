if ( exists('g:loaded_uwin') && g:loaded_uwin ) || v:version < 700 || &cp
	fini
en

let g:loaded_uwin = 1

command! -nargs=0 FindCssProperty    :call Uwin#FindCssClassDefinition()

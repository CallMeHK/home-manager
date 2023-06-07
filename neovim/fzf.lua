vim.cmd([["
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden --glob '!.git' -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0) 


function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

function! ParseSpaces(str)
	let str_array=split(a:str, ' ')
	return str_array
endfunction

function! WildcardifyString(str)
	let args = ParseSpaces(a:str)
	let search_term=args[0]
	for term in args[1:]
		let search_term=search_term . '.*?' . term
	endfor
	return search_term
endfunction

function! WildcardRg(...)
	let arg1 = a:000[0]
	let wildcarded_string = WildcardifyString(arg1)
	execute 'Rg ' . wildcarded_string
endfunction

command! -nargs=* Rgx :call WildcardRg(<q-args>)

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
"]])

"""""VIM TERMINAL CONFIG"""""
function! TerminalWrapper(command) abort
	if !exists('g:split_term_style') | let g:split_term_style = 'vertical' | endif
	if g:split_term_style ==# 'vertical'
		let buffercmd = 'vnew'
	elseif g:split_term_style ==# 'horizontal'
		let buffercmd = 'new'
	else
		echoerr 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'' but is currently set to ''' . g:split_term_style . ''')'
		throw 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'')'
	endif
  exec 'w'
	exec buffercmd
    if exists('g:split_term_resize_cmd')
		exec g:split_term_resize_cmd
	endif
	exec 'term ' . a:command
	exec 'startinsert'
endfunction

function! TerminalTab() abort
  exec 'tabnew'
  exec 'terminal' 
  exec 'startinsert'
endfunction

let g:split_term_style = 'horizontal'
let g:split_term_resize_cmd = 'resize 10'
"""""""""""""""""""""""""""""

"""""EMPTY TERMINAL"""""
command! -nargs=0 CreateTerminalTab call TerminalTab()
nnoremap <leader>t :CreateTerminalTab<CR>
"command! -nargs=0 CreateTerminal call TerminalWrapper(printf(''))
"nnoremap <leader>t :CreateTerminal<CR>
""""""""""""""""""""""""

"""""LANGUAGE COMPILE AND RUN CONFIGURATION"""""
command! -nargs=0 PYLINT call TermninalWrapper(printf('pylint %s', expand('%')))
command! -nargs=0 COVERAGE call TerminalWrapper(printf('python3 -m coverage run %s && python3 -m coverage report -m', expand('%')))
command! -nargs=0 CPP call TerminalWrapper(printf('clang++ -std=c++17 %s -o ./Output/%s.out && .//Output/%s.out', expand('%'), expand('%'), expand('%')))
command! -nargs=0 C call TerminalWrapper(printf('gcc %s -Wall -Werror -ansi -pedantic -o ./%s.out && ./%s.out', expand('%'), expand('%'), expand('%')))
command! -nargs=0 PYTHON call TerminalWrapper(printf('python3 %s', expand('%')))
command! -nargs=0 JAVA call TerminalWrapper(printf('javac %s && java %s', expand('%'), expand('%')))
command! -nargs=0 JUNIT call TerminalWrapper(printf('javac TestCases.java && java org.junit.runner.JUnitCore TestCases'))
command! -nargs=0 PROCESSING call TerminalWrapper(printf('javac -cp ${CLASSPATH}:processing-experimental.jar %s && java -cp ${CLASSPATH}:processing-experimental.jar %s', expand('%'), expand('%')))
command! -nargs=0 GORUN call TerminalWrapper(printf('go run %s', expand('%')))
command! -nargs=0 GOBUILD call TerminalWrapper(printf('go build %s', expand('%')))
command! -nargs=0 GOINSTALL call TerminalWrapper(printf('go install'))
""""""""""""""""""""""""""""""""""""""""""""""""

"""""CPP AUTOCOMMANDS"""""
augroup CppToolKit
    autocmd!
    autocmd FileType cpp nnoremap <leader>fh :CPP<CR>
augroup END
""""""""""""""""""""""""""

"""""C AUTOCOMMANDS"""""
augroup CToolKit
    autocmd!
    autocmd FileType c nnoremap <leader>fh :C<CR>
augroup END
""""""""""""""""""""""""""

"""""PYTHON AUTOCOMMANDS"""""
augroup PythonToolKit
    autocmd!
    autocmd FileType python nnoremap <leader>fh :PYTHON<CR>
    autocmd FileType python nnoremap <leader>fc :COVERAGE<CR>
augroup END
"""""""""""""""""""""""""""""

"""""JAVA AUTOCOMMANDS"""""
augroup JavaToolKit
    autocmd!
    autocmd FileType java nnoremap <leader>fj :w<CR> :!javac % && java %<CR>
    autocmd FileType java nnoremap <leader>fh :JAVA<CR>
    autocmd FileType java nnoremap <leader>ft :JUNIT<CR>
    autocmd FileType java nnoremap <leader>fr :PROCESSING<CR>
augroup END
"""""""""""""""""""""""""""

"""""GO AUTOCOMMANDS"""""
augroup GoToolKit
  autocmd!
  autocmd FileType go nnoremap <leader>fj :w<CR> :!go run %<CR>
  autocmd FileType go nnoremap <leader>r :GORUN<CR>
  autocmd FileType go nnoremap <leader>gb :GOBUILD<CR>
  autocmd FileType go nnoremap <leader>gi :GOINSTALL<CR>
augroup END
"""""""""""""""""""""""""

"""""COMMENT AUTOCOMMANDS"""""
augroup Comments
    autocmd!
    autocmd FileType javascript nnoremap <leader>c I//<esc>
    autocmd FileType python nnoremap <leader>c I#<esc>
augroup END
""""""""""""""""""""""""""""""

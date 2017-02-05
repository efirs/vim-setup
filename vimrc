set list listchars=tab:→\ ,trail:·
set tabstop=4
set shiftwidth=4
set cindent
au BufNewFile,BufRead *.ic set filetype=c
set number
" set textwidth=79 set autowrite
map cn <esc>:cn<cr>
map cp <esc>:cp<cr>
set formatoptions=cq
set textwidth=80
set colorcolumn=81
highlight ColorColumn ctermbg=235 guibg=#2c2d27

execute pathogen#infect()

filetype plugin indent on

"base16 color theme
let g:base16_shell_path='~/.config/base16-shell/scripts'
let base16colorspace=256
colorscheme base16-default-dark
set background=dark

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:gitgutter_max_signs=1000
let g:airline#extensions#whitespace#trailing_format='trail[%s]'
let g:airline#extensions#whitespace#mixed_indent_format='mixed[%s]'
let g:airline_theme='base16'

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

let g:startify_list_order = [
	            \ ['   Sessions:'],
	            \ 'sessions',
	            \ ['   Most recently used files'],
	            \ 'files',
	            \ ['   Most recently used files in the current directory:'],
	            \ 'dir',
	            \ ['   Bookmarks:'],
	            \ 'bookmarks',
	            \ ['   Commands:'],
	            \ 'commands',
	            \ ]

let g:startify_bookmarks = [ {'c': '~/.vimrc'}, {'b' : '~/.bashrc'} ]
let g:startify_session_persistence = 1
let g:startify_session_before_save = [
            \ 'echo "Cleaning up before saving.."',
            \ 'silent! NERDTreeTabsClose'
            \ ]

function! CCompile(run)
	update
	if filereadable("Makefile")
		:make -j8
	elseif &ft=='cpp'
		if a:run == 'on'
			:!g++ -Wall -std=c++11 -o %.bin % && ./%.bin
		else
			:!g++ -Wall -std=c++11 -o %.bin %
		endif
	elseif &ft=='c'
		if a:run == 'on'
			:!gcc -Wall -std=c99 -o %.bin % && ./%.bin
		else
			:!gcc -Wall -std=c99 -o %.bin %
		endif
	endif
endfunction
map <F8> :call CCompile('on') <CR>
map <F5> :call CCompile('off') <CR>

nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
autocmd FileType go nmap <F5> :GoRun %<CR>
"autocmd FileType c,cpp,objc nmap <F5> :call CCompile('off') <CR>

"ycm
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_path_to_python_interpreter= "/usr/bin/python"
map fi <esc>:YcmCompleter FixIt<cr>
"ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"folds
set foldmethod=syntax
set foldnestmax=2
set nofoldenable
set foldlevel=1

"clang-format
let g:clang_format#code_style="google"
let g:clang_format#style_options = {"UseTab" : "ForIndentation", "TabWidth" : 4, "BreakBeforeBraces" : "Allman", "AllowShortBlocksOnASingleLine" : "false"}

autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

autocmd FileType python nnoremap <buffer>M :!python %<CR>
autocmd FileType go nnoremap <buffer>M :GoRun %<CR>
autocmd FileType c,cpp,objc nnoremap <buffer>M :make -j8<CR>

runtime! ftplugin/man.vim

"vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1


set tags=./tags,../tags,../../tags,../../../tags,../../../../tags,${PWD}/tags,../../../../../tags,../../../.../../../tags,~/efl/git/core/tags
set nu "show line number
set ci
set ai "auto indent
set hls "highlight search string
set tabstop=4 "the width of a hard tabstop
set shiftwidth=4 "the size of an indent
set pastetoggle=<Ins>
set cindent
set ruler "show ruler at the right bottom
set is
set ignorecase "ignore case on search
set smartcase " do not ignore case when there is a capital letter
set nowrapscan " do not wrap around when searching
"set textwidth=79    " 만약 79번째 글자를 넘어가면 \
"set wrap            " 자동으로 <CR>를 삽입하여 다음 줄로 넘어간다.
colorscheme desert "evening

" indent for e17  Ref:http://trac.enlightenment.org/e/wiki/ECoding
nnoremap <silent> <F9> :set ts=8 sw=3 sts=3 expandtab cino=>5n-3f0^-2{2(0W1st0<CR>

" Show trailing whitespace and spaces before tabs
hi link localWhitespaceError Error
au Syntax * syn match localWhitespaceError /\(\zs\%#\|\s\)\+$/ display
au Syntax * syn match localWhitespaceError / \+\ze\t/ display

" cscope
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb
if filereadable("./cscope.out")
	cs add cscope.out
else
	if filereadable("/home/seoz/efl/git/core/cscope.out")
		cs add /home/seoz/efl/git/core/cscope.out
	else
		cs add /usr/src/linux/cscope.out
	endif
endif
set csverb

" Set color over 80 chars
au BufRead *.c,*.cpp,*.h match ExtraOver /\s\+\%#\@<!$\|\%81v.*/
highlight ExtraOver ctermbg=red ctermfg=white guibg=#59292

" build and install with <F2>
map <F2> :2<cr>:!make<cr>
map <F3> :2<cr>:!sudo make install<cr>

" taglist plugin configuration
"let Tlist_Auto_Open = 1
let Tlist_Auto_Update = 1
let Tlist_Exit_OnlyWindow = 1
nnoremap <silent><F5> :Tlist<cr>

" spell check
" command: ]s, [s, z=
nnoremap <silent> <F10> :set spell spelllang=en_us<CR>
nnoremap <silent> <F11> :set nospell<CR>

" git commit message check
autocmd Filetype gitcommit setlocal spell textwidth=72

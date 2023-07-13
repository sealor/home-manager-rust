set background=light

set ruler
set nomodeline modelines=0

set hidden
set number
set mouse=

" Tab handling
set autoindent
set shiftwidth=2 tabstop=2
set expandtab

" Visible whitespaces
set list
set listchars=tab:\|\ ,trail:?,eol:.

" Left Explorer
let g:netrw_winsize=16
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=4

" Open explorer on start-up
augroup ProjectDrawer
	autocmd!
	autocmd VimEnter * :Vexplore | wincmd w
augroup END

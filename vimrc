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

" Left explorer
let g:netrw_winsize=16
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=4

" Open explorere on start-up
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore | wincmd w
augroup END

" hide incremental search highlighting when entering insert mode
set hlsearch incsearch
autocmd InsertEnter * set nohlsearch
autocmd InsertEnter * nnoremap <silent> n :nunmap n<CR>:set hlsearch<CR>n

" Simple 2 char AceJump/EasyMotion/Sneak search
function! SearchNextChars(direction)
  let l:char1 = nr2char(getchar())
  let l:char2 = nr2char(getchar())
  call feedkeys(a:direction.l:char1.l:char2."\<CR>")
endfunction
nmap <silent> s :call SearchNextChars("/")<CR>
nmap <silent> S :call SearchNextChars("?")<CR>

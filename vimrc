
set nocompatible
syntax on
set noswapfile


colorscheme industry
set number
set relativenumber
set numberwidth=6
set showcmd
set wildmenu
set showmatch

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
filetype indent on
set incsearch
set hlsearch

set splitbelow
set splitright

au BufReadPost,BufNewFile Makefile setlocal noexpandtab list

au FileType vim setlocal nonumber norelativenumber

let mapleader = ','

" edit vim rc quickly
nnoremap <leader>rc :vsplit $MYVIMRC<cr>
nnoremap <leader>src :source $MYVIMRC<cr>

inoremap jk <esc>
inoremap <esc> <esc>:echo "no more esc"<cr>i

nnoremap <leader>t :Explore<cr>
nnoremap <leader>w :%s/\s\+$//e<cr>:wa<cr>
nnoremap <leader>q :%s/\s\+$//e<cr>:wq<cr>

"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set listchars=tab:>·,trail:~
nnoremap <leader>= :setlocal list!<cr>


" move from buffer to buffer with ctrl + <movement>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <c-w>h :leftabove vsplit<cr>
nnoremap <c-w>j :split<cr>
nnoremap <c-w>k :leftabove split<cr>
nnoremap <c-w>l :vsplit<cr>



iabbrev ccopy Copyright 2020 George Olson, all rights reserved


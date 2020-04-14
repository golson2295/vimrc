
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

set ignorecase
set smartcase
set incsearch
set hlsearch

set splitbelow
set splitright


augroup filetype_makefile
    autocmd!
    autocmd BufReadPost,BufNewFile Makefile setlocal noexpandtab list
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal nonumber norelativenumber
    nnoremap <c-/> mm^i" <esc>`m
augroup END

augroup javascript
    autocmd!
    autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
    onoremap fp :normal! /\(function.*(.*)\|(.*) *=>\)<cr>t)vF(
    " nnoremap <leader>aFp /(function.*(.*)|(.*) *=>)/<cr>f)F(ci(
    " nnoremap <leader>afp /\(function.*(.*)\|(.*).*=>\)<cr>f)F(ci(
    " nnoremap <leader>aFp ?\(function.*(.*)\|(.*).*=>\)<cr>f)F(ci(
augroup END

augroup c
    autocmd!
    autocmd FileType c :iabbrev <buffer> iff if ()<left>
    autocmd FileType c :iabbrev <buffer> r; return;<left>
    autocmd FileType c :iabbrev <buffer> #i #include<><left>
augroup END

let mapleader = ','

" edit vim rc quickly
nnoremap <leader>rc :vsplit $MYVIMRC<cr>
nnoremap <leader>src :source $MYVIMRC<cr>

" escape is to far
inoremap jk <esc>
inoremap <esc> <esc>:echo "no more esc"<cr>i

" commonly used shortcuts
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



set nocompatible
syntax on
set noswapfile
colorscheme delek


set number
set relativenumber
set numberwidth=6
set showcmd
set wildmenu
set listchars=tab:>·,trail:~
set list

let mapleader = ','


" Tab Settings ------------------------------{{{
filetype indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" }}}


" Search Settings ---------------------------------{{{
set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch
" }}}


" Vimscript file Settings ------------------------------------{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    " autocmd FileType vim setlocal nonumber norelativenumber
    autocmd FileType vim :iabbrev <buffer> nm nnoremap
    autocmd FileType vim :iabbrev <buffer> im inoremap
    autocmd FileType vim :iabbrev <buffer> om onoremap
    autocmd FileType vim :iabbrev <buffer> ib :iabbrev <buffer>
    autocmd FileType vim :iabbrev <buffer> s set
    autocmd FileType vim :iabbrev <buffer> a autocmd
    autocmd FileType vim :iabbrev <buffer> af autocmd<space>Filetype
    autocmd FileType vim :iabbrev <buffer> afv autocmd<space>Filetype<space>vim
    autocmd FileType vim :iabbrev <buffer> afj autocmd<space>Filetype<space>javascript
    autocmd FileType vim :iabbrev <buffer> afc autocmd<space>Filetype<space>c
    autocmd FileType vim :iabbrev <buffer> ag augroup
    autocmd FileType vim :iabbrev <buffer> age augroup<space>END
    autocmd FileType vim nnoremap <c-n> mm^i" <esc>`m
    autocmd FileType vim setlocal statusline=[\%4l/\%4L]:\%2c\%5Y
augroup END
" }}}


" Javascript file Settings ----------------------------------{{{
augroup filetype_javascript
    autocmd!
    autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
    " onoremap fp :normal! /\(function.*(.*)\|(.*) *=>\)<cr>t)vF(
    " nnoremap <leader>aFp /(function.*(.*)|(.*) *=>)/<cr>f)F(ci(
    " nnoremap <leader>afp /\(function.*(.*)\|(.*).*=>\)<cr>f)F(ci(
    " nnoremap <leader>aFp ?\(function.*(.*)\|(.*).*=>\)<cr>f)F(ci(
augroup END
" }}}


" C file Settings ---------------------------------{{{
augroup filetype_c
    autocmd!
    autocmd FileType c :iabbrev <buffer> iff if ()<left>
    autocmd FileType c :iabbrev <buffer> r; return;<left>
    autocmd FileType c :iabbrev <buffer> #i #include<><left>
augroup END
" }}}


" Makefile file Settings -------------------------------------{{{
augroup filetype_makefile
    autocmd!
    autocmd FileType Makefile setlocal noexpandtab list
augroup END
" }}}


" VimRC quick edit ------------------------------------------{{{
nnoremap <leader>rc :vsplit $MYVIMRC<cr>
nnoremap <leader>src :source $MYVIMRC<cr>
"  }}}


augroup testgroup
    autocmd BufWrite * :echom "Baz"
augroup END

" escape is to far
inoremap jk <esc>

" netrw commands settings
nnoremap <leader>t :Lexplore<cr>

" save exit trim whitespace
nnoremap <leader>w :%s/\s\+$//e<cr>:wa<cr>
nnoremap <leader>q :%s/\s\+$//e<cr>:wq<cr>

" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
nnoremap <leader>= :setlocal list!<cr>


" Split Control Settings ------------------------------{{{
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" }}}


" Failed Commands ------------------------------------{{{
" nnoremap <c-w>h :vsplit<cr>
" nnoremap <c-w>j :rightbelow split<cr>
" nnoremap <c-w>k :rightabove split<cr>
" nnoremap <c-w>l :vsplit<cr>
" }}}


iabbrev ccopy Copyright 2020 George Olson, all rights reserved

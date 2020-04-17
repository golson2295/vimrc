
set nocompatible
syntax on
set noswapfile
colorscheme delek

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set number
" set colorcolumn=80
set relativenumber
set numberwidth=6
set showcmd
set wildmenu
set listchars=tab:>·,trail:~
set list
let g:netrw_winsize=50

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

" COC Settings ========================================={{{
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}}


iabbrev ccopy Copyright 2020 George Olson, all rights reserved

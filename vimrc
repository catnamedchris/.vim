" Init ---{{{
" Load plugins
call pathogen#infect()
" }}}

" Appearance ----{{{
" Colors/Font
set background=dark
colorscheme solarized
if has("gui_running")
    set lines=56
    set columns=83

    if has("gui_gtk")
        set guifont=Monaco\ 10
    elseif has("gui_macvim")
        set guifont=Monaco\ for\ Powerline:h12
    else
        set guifont=Monospace\ 10
    endif
endif

" No menu, toolbar or left/right scrollbar
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" Enable line numbers, column marker, and status line
set number
set colorcolumn=80
set laststatus=2

set list
set listchars=trail:•
" }}}

" File-specific settings ----{{{
" Enable file-specific plugins and indentation
filetype plugin indent on

" Syntax highlighting
syntax on

" Vim file folding
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Indentation/tabs ----{{{
set autoindent

set expandtab
set tabstop=4
set shiftwidth=4
autocmd FileType html setlocal tabstop=2 shiftwidth=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
autocmd FileType jade setlocal tabstop=2 shiftwidth=2
" }}}

" Mappings ----{{{
" Zen-coding expansion key
"let g:user_zen_expandabbr_key="<c-e>"
let g:user_emmet_expandabbr_key = '<c-e>'

" Set comma as the leader
let mapleader=","
let maplocalleader="\\"
set timeoutlen=250

" Move line up/down
nnoremap <c-k> ddkP
nnoremap <c-j> ddp

" Move to beginning/end of a line
nnoremap H ^
nnoremap L $

" Move to previous buffer
nnoremap  <leader><leader> <c-^>

" Open .vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>

" Delete line while in insert mode
inoremap <c-d> <esc>ddi

" Exit insert mode
inoremap jk <esc>
inoremap kj <esc>

" Window navigation
nnoremap <a-k> <c-w>k
nnoremap <a-j> <c-w>j
nnoremap <a-h> <c-w>h
nnoremap <a-l> <c-w>l

" ...analogous iTerm2 bindings
nnoremap ˚ <c-w>k
nnoremap ∆ <c-w>j
nnoremap ˙ <c-w>h
nnoremap ¬ <c-w>l

" Window repositioning
nnoremap <leader><a-k> <c-w>K
nnoremap <leader><a-j> <c-w>J
nnoremap <leader><a-h> <c-w>H
nnoremap <leader><a-l> <c-w>L

" ...analogous iTerm2 bindings
nnoremap <leader>˚ <c-w>K
nnoremap <leader>∆ <c-w>J
nnoremap <leader>˙ <c-w>H
nnoremap <leader>¬ <c-w>L

" Window resizing
if bufwinnr(1)
    nnoremap <a-up> <c-w>+
    nnoremap <a-down> <c-w>-
    nnoremap <a-left> <c-w><
    nnoremap <a-right> <c-w>>
    nnoremap <a-=> <c-w>=

    " ...replacement iTerm2 bindings
    nnoremap  <c-w>+
    nnoremap Ô <c-w>-
    nnoremap Ó <c-w><
    nnoremap Ò <c-w>>
    nnoremap ≠ <c-w>=
endif

" Repeat recording
nnoremap <space> @q

" Javascript self-executing function template
iabbrev jsf (function() {}());<left><left><left><left><left><cr><tab><left>

" Move to next warning/error
nnoremap <leader>ne :lnext<cr>
nnoremap <leader>pe :lprev<cr>
" }}}

" Syntastic ----{{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_auto_loc_list=1
" }}}

" Other ----{{{
" Don't use vi defaults
set nocompatible

" Automatically set current directory to that of the current file. This will
" interfere with the Ctrl-P plugin.
" set autochdir

" No text wrapping since wrapping doesn't follow indents
set nowrap

" Search
set incsearch
set hlsearch
set ignorecase

" Enable buffer switching without saving
set hidden

" Don't create backup or swap files
set nobackup
set noswapfile

" Open file in chrome/firefox
if has("mac")
    cabbrev ff :! open -a firefox %:p<cr>
    cabbrev sf :! open -a safari %:p<cr>
elseif has("unix")
    cabbrev ch :! google-chrome --enable-file-cookies --allow-file-access-from-files %:p&<cr>
    cabbrev cr :! chromium-browser --enable-file-cookies --allow-file-access-from-files %:p&<cr>
    cabbrev ff :! firefox %:p&<cr>
endif

" Automatically reload .vimrc upon saving
augroup reload
    autocmd!
    autocmd BufWritePost .vimrc source $MYVIMRC
augroup END

" Automatically reload files if they've been changed externally
set autoread

" Allow ctrlp to open multiple buffers of the same file
let g:ctrlp_switch_buffer = ''

let g:ctrlp_working_path_mode = 'ra'

" Enable powerline statusline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
" }}}


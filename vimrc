" Init ---{{{
" Load plugins
call pathogen#infect()
" }}}

" Appearance ----{{{
" Colors
colorscheme solarized

" Font
if has("gui_running")
    if has("gui_gtk")
        set guifont=Monaco\ 12
    elseif has("gui_macvim")
        set guifont=Monaco:h12
    else
        set guifont=Monospace\ 10
    endif
endif

" No toolbar or right scrollbar
set guioptions-=T
set guioptions-=r

" Enable line numbers, column marker, and status line
set number
set colorcolumn=80
set laststatus=2
set statusline=%f\ %m\ %r%=Line:\ %l/%-5L\ Col:\ %-5c\ Buf:\ #%n 
" }}}

" Indentation/tabs ----{{{
set autoindent

set expandtab
set tabstop=4
set shiftwidth=4
autocmd FileType html setlocal tabstop=2 shiftwidth=2
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

" Mappings ----{{{
" Zen-coding expansion key
let g:user_zen_expandabbr_key="<c-e>"

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

" Move to previous cursor location
nnoremap  <leader><leader> <c-^>

" Open .vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>

" Delete line while in insert mode
inoremap <c-d> <esc>ddi

" Exit insert mode
inoremap jk <esc>
inoremap kj <esc>
" }}}

" Other ----{{{
" Don't use vi defaults
set nocompatible

" Automatically set current directory to that of the current file
set autochdir

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
    abbrev ff :! open -a firefox %:p<cr>
endif
if has("unix")
    abbrev ch :! google-chrome %:p<cr>
    abbrev ff :! firefox %:p<cr>
endif

" Automatically reload .vimrc upon saving
augroup reload
    autocmd!
    autocmd BufWritePost .vimrc source $MYVIMRC
augroup END
" }}}

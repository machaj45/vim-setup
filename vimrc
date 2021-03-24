"It is needed for ycm
set encoding=utf-8
" Not be vi
set nocompatible
" This makes backspace normal
set backspace=indent,eol,start
" Setting up number line in the left
set number
set relativenumber
" Nice highlight of test search
set hlsearch

let mapleader = ","
syntax on
filetype plugin on

nnoremap <leader>y "+y
nnoremap <leader>p "+p
" Making vim so match better
command WQ wq
command Wq wq
command W w
command Q q

" Remapping : to ; in order to make transition to command mode faster
nnoremap : ;
nnoremap ; :


" FINDING FILES
" Search down in subdirectories 
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Create the tags file from vim directly
command! MakeTags !ctags -R .

" TAGS NAVIGATION
" ctrl + ] jump to tag under cursor
" g + ctrl + ] jump to ambiguous tag under cursor
" ctrl + t jump back up the tag stack

let g:netrw_banner=0
"let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^|\s\s)\zs\.\S\+'

"fast guy config
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set incsearch
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
"PLUG plugin manager

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox
set background=dark



nnoremap <leader>gd :YcmCompleter GoTo<CR>
nnoremap <leader>gf :YcmCompleter FixIt<CR>

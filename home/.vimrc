set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'altercation/vim-colors-solarized'

Bundle 'kchmck/vim-coffee-script'
Bundle 'jeroenp/vim-xquery-syntax'
Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'

Bundle 'kien/ctrlp.vim'
Bundle 'godlygeek/tabular'
Bundle 'mhinz/vim-signify'
Bundle 'Shutnik/jshint2.vim'
Bundle 'ervandew/supertab'
Plugin 'itchyny/lightline.vim'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

imap jj <Esc>

" Remap for vim-tmux-navigator
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Easy align for js/yml
vmap <Leader>a :Tab /:\zs<CR>

set splitbelow
set splitright
syntax enable

" Colors
set t_Co=256
set background=dark
colorscheme solarized

" Search settings
"set hlsearch
set incsearch

" Indentation settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set ai

set relativenumber
set nu

" Airline settings
set laststatus=2
let g:lightline = {
	\ 'colorscheme': 'solarized'
	\ }
" Hide default mode indicator
" set noshowmode
"let g:airline_powerline_fonts = 1
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"
"
" CtrlP settings
let g:ctrlp_open_new_file = 'v'
set ttimeoutlen=50


" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
let g:solarized_visibility='low'

" Emmet remap
"let g:user_emmet_leader_key='<C-e>'

nmap <Leader>j :JSHint<CR>

nnoremap K i<Enter><Esc>
set directory=~/.vim/swap

set undodir=~/.vim/backups
set undofile

set backupdir=~/.vim/backups
set backup
set writebackup
set backupcopy=auto

set wildignore+=*/node_modules/*,*/bower_components/*
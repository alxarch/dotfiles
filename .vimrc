" For a paranoia.
" Normally `:set nocp` is not needed, because it is done automatically
" when .vimrc is found.
if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

set encoding=utf-8

set rtp+=/usr/share/vim/vimfiles

if exists('*minpac#init')
	call minpac#init()

	" let Vundle manage Vundle
	" required!
	call minpac#add('k-takata/minpac', {'type': 'opt'})

	call minpac#add('mattn/webapi-vim')

	" Syntax checking hacks for vim
	call minpac#add('vim-syntastic/syntastic')

	" Vim plugin that displays tags in a window
	call minpac#add('majutsushi/tagbar')


	" Completor is an asynchronous code completion framework for vim8. 
	call minpac#add('maralla/completor.vim')

	call minpac#add('rust-lang/rust.vim')
	call minpac#add('racer-rust/vim-racer')


	" call minpac#add('autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'})

	" call minpac#add('vim-erlang/vim-erlang-runtime')
	" call minpac#add('vim-erlang/vim-erlang-tags')
	" call minpac#add('vim-erlang/vim-erlang-omnicomplete')
	" call minpac#add('vim-erlang/vim-erlang-compiler')
	" call minpac#add('elixir-editors/vim-elixir')
	" call minpac#add('slashmili/alchemist.vim')

	" call minpac#add('lukerandall/haskellmode-vim')

	" original repos on GitHub
	" call minpac#add('altercation/vim-colors-solarized')
	" call minpac#add('digitaltoad/vim-jade')
	call minpac#add('junegunn/vim-easy-align')

	call minpac#add('junegunn/fzf.vim')
	" Plugin 'godlygeek/tabular'
	call minpac#add('mhinz/vim-signify')
	" call minpac#add('terryma/vim-multiple-cursors')
	" Plugin 'ervandew/supertab'
	" Plugin 'itchyny/lightline.vim'
	" Plugin 'shime/vim-livedown'
	" call minpac#add('christoomey/vim-tmux-navigator')
	" Plugin 'tpope/vim-repeat'
	" Plugin 'tpope/vim-commentary'

	call minpac#add('kchmck/vim-coffee-script')
	call minpac#add('jwhitley/vim-literate-coffeescript')

	call minpac#add('fatih/vim-go')

	" Lightweight, customizable and functional Vim plugin for JSHint integration.
	call minpac#add('NikolayFrantsev/jshint2.vim')
	" YAJS: Yet Another JavaScript Syntax
	call minpac#add('othree/yajs.vim')

	
	" Clojure
	call minpac#add('guns/vim-clojure-static')
	call minpac#add('tpope/vim-fireplace')
	call minpac#add('tpope/vim-salve')
	call minpac#add('tpope/vim-projectionist')
	call minpac#add('tpope/vim-dispatch')
	call minpac#add('luochen1990/rainbow')
	call minpac#add('guns/vim-sexp')
	call minpac#add('gberenfield/cljfold.vim')
	" call minpac#add('jeroenp/vim-xquery-syntax')
	" call minpac#add('wavded/vim-stylus')
endif

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

imap jj <Esc>

" Remap for vim-tmux-navigator
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


set splitbelow
set splitright
syntax enable

" Colors
set t_Co=256
set background=light
" colorscheme solarized

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

set ttimeoutlen=50

" Syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" TagBar setup
let g:tagbar_autoclose = 1
let g:tagbar_compact = 1
nmap <F8> :TagbarToggle<CR>

"" Shortcut for live markdown preview
"nmap <leader>m :LivedownPreview<CR>

" Use the same symbols as TextMate for tabstops and EOLs
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
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

" Open tig inside vim :)
nmap <leader>g :!tig status<CR>

autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
autocmd BufNewFile,BufReadPost *.litcoffee setl foldmethod=indent nofoldenable
autocmd FileType litcoffee runtime ftplugin/coffee.vim

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" FZF settings

" Map Ctrl-P to FZF
nmap <C-P> :FZF<CR>
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': '10split enew' }

" " <<< LSP >>> {{{
" 
" " Required for operations modifying multiple buffers like rename.
" set hidden
" 
" let g:LanguageClient_autoStart = 0
" nnoremap <leader>lcs :LanguageClientStart<CR>
" 
" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"     \ 'python': ['/usr/local/bin/pyls'],
"     \ }
" 
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" " Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" 
" " }}} <<< LSP >>>

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Rust >>>
let g:autofmt_autosave = 1
set hidden
let g:racer_cmd = '/usr/bin/racer'
let g:racer_experimental_completer = 1

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
" au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" <<< Rust

"" Easy align for js/yml
"vmap <Leader>a :Tab /\zs:<CR>

set exrc
set secure


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug + auto install
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
	so ~/.vimrc
endif

call plug#begin()
	" status line
	Plug 'bling/vim-airline'
	" colors
	Plug 'tomasr/molokai'
	" focus mode - on demand load with first :Goyo command
	Plug 'junegunn/goyo.vim', {'on': 'Goyo' }
	" comment/uncomment 
	Plug 'tpope/vim-commentary'
call plug#end()

imap jk <Esc>

" use builtin colors before plugins are installed
if !empty(glob('~/.vim/plugged/molokai'))
	colorscheme molokai
else
	colorscheme elflord
endif

syntax on
set t_Co=256

set showcmd           " show partial commands
set numberwidth=4 		" move numbers to the right
set mouse=a 					" enable mouse support
set scrolloff=4 			" don't touch the edges

set backspace=indent,eol,start "enable backspace over anything

set wildmode=longest,list,full 

" always show status line
set laststatus=2

"persistant undo
set undodir=~/.vim/undo 	" persistent undo storage
set undofile           		" persistent undo on

" Wrap lines at 80
set textwidth=80
"set wrapmargin=2

" indenting 
set tabstop=2
set shiftwidth=2
set autoindent


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch		"highlight search results
set incsearch		"search as charaters are typed
set ignorecase smartcase "Case sensitive only if there are uppers
" turn off search highlighting by hitting return
nnoremap <CR> :nohlsearch<cr>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" load files edited outside of vim automatically
set autoread

" jump to last cursor position unless it's invalid or in an event handler
" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal g`\"" |
	\ endif

" Disable detection of whitespace errors
let g:airline#extensions#whitespace#enabled=0

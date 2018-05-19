"""""""""""""""""""""""""""""""""""""
" vim-plug + auto install
"""""""""""""""""""""""""""""""
filetype plugin indent on
set cm=blowfish2

" this loads junegunn's package manager in a fresh vim
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
	Plug 'junegunn/seoul256.vim'
	Plug 'tomasr/molokai'
	" focus mode - on demand load with first :Goyo command
	Plug 'junegunn/goyo.vim', {'on': 'Goyo' }
	"auto save - my fork
	"Plug 'mattrfk/vim-auto-save'
	" for prose
	Plug 'reedes/vim-pencil'
	" File browser
	Plug 'scrooloose/nerdtree'

	"git wrapper
	Plug 'tpope/vim-fugitive'
call plug#end()

"softwrap
set linebreak

" use builtin colors before plugins are installed
if !empty(glob('~/.vim/plugged/molokai'))
	let g:seoul256_background = 235
	colorscheme seoul256
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

let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
autocmd FileType text call pencil#init()

" indenting 
set tabstop=2
set shiftwidth=2
set autoindent

"""""""""""""""""""""""""""""""""""""""
" Searching
"""""""""""""""""""""""""""""""""""""""""""
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


" underline current line
nmap <F8> yypVr-
inoremap <F8> <Esc>yypVr-

" insert date and time
nnoremap <F9> "=strftime("%a, %d %b %Y %H:%M:%S %z")<CR>PyypVr-
inoremap <F9> <C-R>=strftime("%a, %d %b %Y %H:%M:%S %z")<CR>

"paste
nmap <F10> o<Esc><CR>"*P

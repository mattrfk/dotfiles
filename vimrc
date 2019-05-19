" vim-plug auto install
filetype plugin indent on
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
	" status line
	Plug 'bling/vim-airline'

	" colors
	Plug 'tomasr/molokai'

	" for prose
	Plug 'reedes/vim-pencil'

	" focus mode
	Plug 'junegunn/goyo.vim', {'on': 'Goyo' }

	" for python
	Plug 'davidhalter/jedi-vim'

	Plug 'scrooloose/nerdcommenter'

	" extra commands (Rename, Chmod, Delete, etc)
	Plug 'tpope/vim-eunuch'

call plug#end()

" set encryption method
set cm=blowfish2

"softwrap
set linebreak

" use builtin colors before plugins are installed
if !empty(glob('~/.vim/plugged/molokai'))
	colorscheme molokai
else
	colorscheme elflord
endif

set showcmd           " show partial commands
set mouse=a 					" enable mouse support
set scrolloff=4 			" don't touch the edges

set clipboard+=unnamed  " merge clipboard with sys
set paste               " paste mode

set backspace=indent,eol,start "enable backspace over anything

set wildmode=longest,list,full

let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
autocmd FileType text call pencil#init()

" indenting
set tabstop=2
set shiftwidth=2
set autoindent

" Searching
set hlsearch		          "highlight search results
set incsearch		          "search as charaters are typed
set ignorecase smartcase  "Case sensitive only if there are uppers

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


" print the date and underline it
nnoremap <F9>      o<C-R>=strftime("%a, %d %b %Y")<CR><Esc>yypVr-o
inoremap <F9> <Esc>o<C-R>=strftime("%a, %d %b %Y")<CR><Esc>yypVr-o


" in normal mode, hit enter and run the file
autocmd BufNewFile,BufRead *.rb map <cr> :w\|:!clear; ./%<cr>

autocmd BufNewFile,Bufread *c,*.rb,*.py,*.js,*.html,*.css set number

" disable scrollbars in gvim
set guioptions=

" Disable detection of whitespace errors
let g:airline#extensions#whitespace#enabled=0

" A	displays the mode + additional flags
" B	VCS information (branch, hunk summary) (master)
" C	filename + read-only flag (~/.vim/vimrc RO)
" X	filetype (vim)
" Y	file encoding[fileformat] (utf-8[unix])
" Z	current position in the file
let g:airline_section_b = ""

let g:jedi#force_py_version = 3
let g:jedi#popup_on_dot = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 0

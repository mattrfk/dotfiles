"""""""""""""""""""""""""""""""""""""
" vim-plug + auto install
"""""""""""""""""""""""""""""""
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
	" focus mode - on demand load with first :Goyo command
	Plug 'junegunn/goyo.vim', {'on': 'Goyo' }
	"auto save - my fork
	"Plug 'mattrfk/vim-auto-save'
	" for prose
	Plug 'reedes/vim-pencil'
	" File browser
	Plug 'scrooloose/nerdtree'

	" vim autocomplete
	Plug 'davidhalter/jedi-vim'

	"git wrapper
	Plug 'tpope/vim-fugitive'

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

" A	displays the mode + additional flags
" B	VCS information (branch, hunk summary) (master)
" C	filename + read-only flag (~/.vim/vimrc RO)
" X	filetype (vim)
" Y	file encoding[fileformat] (utf-8[unix])
" Z	current position in the file
let g:airline_section_b = ""
let g:airline_section_y = ""

" insert date and time and underline it
nnoremap <F9> o<Esc>i=strftime("%a, %d %b %Y %H:%M:%S %z")<CR>yypVr-
inoremap <F9> <C-R>=strftime("%a, %d %b %Y %H:%M:%S %z")<CR>

"paste from system clipboard
nmap <F10> o<Esc><CR>"*P

" Set the title of the Terminal to the currently open file
function! SetTerminalTitle()
    let titleString = expand('%:t')
    if len(titleString) > 0
        let &titlestring = expand('%:t')
        " this is the format iTerm2 expects when setting the window title
        let args = "\033];".&titlestring."\007"
        let cmd = 'silent !echo -e "'.args.'"'
        execute cmd
        redraw!
    endif
endfunction
autocmd BufEnter * call SetTerminalTitle()

" in normal mode, hit enter and run the file
autocmd BufNewFile,BufRead *.rb map <cr> :w\|:!clear; ./%<cr>
"autocmd BufNewFile,BufRead *.js map <cr> :w\|:!clear;./%<cr>

autocmd BufNewFile,Bufread *c,*.rb,*.py,*.js,*.html,*.css set number

" disable scrollbars in macvim
set guioptions=

let g:jedi#force_py_version = 3

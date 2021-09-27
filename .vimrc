" Leader is space
let mapleader = "\<Space>"

" Set text files to be encoded in UTF-8
set encoding=utf-8

" Detect file types and specific indents/settings
filetype plugin indent on

" Find files in project
set path+=**
set wildmenu

" No text wrapping
set nowrap

" Common search options
set hlsearch
set incsearch
nnoremap <leader>h :set hlsearch!<CR>

" Ignore case sensitivity, unless there is a capital char
set ignorecase
set smartcase

" Backspace works on indents and across lines
set backspace=indent,eol,start

" Highlight the current line of the cursor
" only in active buffer
augroup cursorlineonoff
	autocmd! 
	autocmd BufEnter,WinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
augroup END

" Activate spell check in LaTeX
augroup texspell
	autocmd!
	autocmd FileType tex setlocal spell spelllang=en_us
augroup END

" Relative line numbers
set number relativenumber

" Highlight matching brackets
set showmatch
set matchpairs=(:),\[:\],{:},<:>

" Indentation
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Ask if save before exiting
set confirm

" Start scrolling before getting the screen edge
set scrolloff=4


" Copy and paste from external clipboard
nnoremap <leader>y "+y
nnoremap <leader>p "+p

" Press leader twice to switch between your last two buffers
nnoremap <leader><leader> <c-^>

" Switch ; and : for easier access
nnoremap ; :
nnoremap : ;

" Disable arrow keys in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Allow proper movement when wrap is on
nnoremap j gj
nnoremap k gk

" Start a new change before deleting with Ctrl+u, so a normal mode "u" can still
" recover the deleted word or line.  Normally Ctrl+u while in insert mode
" would delete the text without undo history and it would be lost forever.
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>


" Plugins
call plug#begin('~/.vim/plugged')
Plug 'takac/vim-hardtime' 
Plug 'gruvbox-community/gruvbox'
call plug#end()
let g:hardtime_default_on = 1

" Colors
syntax on
colorscheme gruvbox
"highlight CursorLine cterm=NONE ctermbg=Black
"highlight Visual ctermbg=Blue


" Variables
let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.vimrc"


" netrw config
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_list_hide = '^\..*'
let g:netrw_hide = 1
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

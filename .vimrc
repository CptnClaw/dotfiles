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

" Always show statusline (for lightline plugin)
set laststatus=2
set noshowmode
set showcmd

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
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Ask if save before exiting
set confirm

" Allow jumping between buffers without saving
set hidden

" Start scrolling before getting the screen edge
set scrolloff=2
set sidescrolloff=4
set sidescroll=1


" Copy and paste from external clipboard
nnoremap <leader>y "+y
nnoremap <leader>p "+p

" Press leader twice to switch between your last two buffers
nnoremap <leader><leader> <c-^>

" Mouse scrolling is nice
if has('mouse')
	set mouse=a
endif

" Allow proper movement when wrap is on
nnoremap j gj
nnoremap k gk

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Substitute command
nnoremap <leader>s :%s///gc<Left><Left><Left><Left>

" Tab navigation
noremap <C-h> :tabp<CR>  " Go left
noremap <C-l> :tabn<CR>  " Go right
noremap <C-j> :tabc<CR>  " Close tab
noremap <C-k> :tabe<CR>  " New tab
nnoremap <leader>t :tab sball<CR>

" Fuzzy find files
nnoremap <leader>o :Files<CR>
nnoremap <leader>b :Buffers<CR>

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'lervag/vimtex'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'takac/vim-hardtime' 
Plug 'gruvbox-community/gruvbox'
call plug#end()
let g:hardtime_default_on = 0

" coc config
source /home/eyal/.vim/coc-config.vim

" Tex-Conceal
let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"
let g:tex_conceal_frac=1
let g:tex_conceal="abdgm"
set conceallevel=2

" NERDTree
function! ToggleNERDTree()
	NERDTreeToggle
	" Set NERDTree instances to be mirrored
	silent NERDTreeMirror
endfunction
nnoremap <leader>n :call ToggleNERDTree()<CR>

" Colors
syntax on
colorscheme gruvbox
"highlight CursorLine cterm=NONE ctermbg=Black
"highlight Visual ctermbg=Blue


" Variables
let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.vimrc"
let $COC="$HOME/.vim/coc-config.vim"


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

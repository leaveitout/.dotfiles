set nocompatible              " be iMproved, required
filetype off                  " required
set shell=bash                " Needed by Vundle if using fish

" Tab behaviour
set expandtab
set shiftwidth=2
set softtabstop=2

" Global subsitition, i.e. replace all instances in line, not just first
set gdefault

" Powerline setup
set guifont=Hack\ 11

" Always show statusline
set laststatus=2

" Line numbers
set nu

" Map 0 to fist non blank character
" noremap 0 ^
" noremap ^ 0

" Jump to beginning and end of lines easier. From http://vimbits.com/bits/16
noremap H ^
noremap L $

" Quick escape route
inoremap jk <Esc>
inoremap kj <Esc>
"inoremap jK <Esc>
"inoremap kJ <Esc>
"inoremap Jk <Esc>
"inoremap Kj <Esc>
"inoremap JK <Esc>
"inoremap KJ <Esc>

" Remap U to <C-r> for easier redo. http://vimbits.com/bits/356
nnoremap U <C-r>

" Use ; for : in normal and visual mode, less keystrokes
nnoremap ; :
vnoremap ; :

" Cut, copy and paste from system clipboard
vnoremap <C-x> "+d
vnoremap <C-c> "+y
noremap <C-v> "+p

" Searching
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch  " Incremental search
set hlsearch   " Highlight search results

" Line length
set colorcolumn=80
set textwidth=80

" Enable highlighting of the current line
set cursorline

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" Easier indentation
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation" Python-mode

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file.
nnoremap <Space> <Nop>
let g:mapleader = " "
let mapleader = " "
let g:maplocalleader = " "
let maplocalleader = " "

" Fast saving
nmap <leader>w :w!<cr>

" Fast quit 
noremap <leader>wq :wq<CR>   " Save and quit
noremap <Leader>q :quit<CR>  " Quit current window
noremap <Leader>Q :qa!<CR>   " Quit all windows

" Fix for slow escape from insert mode
" see stackoverflow.com/questions/15550100/exit-visual-mode-without-delay
set timeoutlen=1000 ttimeoutlen=0

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Vim splitting settings
"
" Consistent mapping for split navigation.
nnoremap <leader>gl <C-W>l
nnoremap <leader>gh <C-W>h
nnoremap <leader>gj <C-W>j
nnoremap <leader>gk <C-W>k

" Consistent mapping for tab navigation.
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-H> :tabfirst<CR>
nnoremap <C-L> :tablast<CR>
inoremap <C-h> <Esc>:tabprevious<CR>i
inoremap <C-l> <Esc>:tabnext<CR>i
inoremap <C-H> <Esc>:tabfirst<CR>i
inoremap <C-L> <Esc>:tablast<CR>i


"let python_highlight_all = 1
"syntax on
"syntax enable
"set background=dark
"set t_Co=256
"let base16colorspace=256
"colorscheme Tomorrow-Night

" More natural split opening
set splitbelow
set splitright

" Set up the swap, backup and undo to go to certain folders
" set backupdir=/home/sean/.vim/backup/
" set directory=/home/sean/.vim/swap/
" set undodir=/home/sean/.vim/undo/

" Turn backup off, since most stuff is in git anyway...
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'Chiel92/vim-autoformat'
Plug 'heavenshell/vim-pydocstring'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'dag/vim-fish'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin specific options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set spell spelllang=en_gb
autocmd FileType plaintex,tex,latex setlocal spell spelllang=en_gb


syntax enable
set termguicolors
"set background=dark
"let base16colorspace=256
colorscheme base16-tomorrow-night

let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1

let g:airline#extensions#ale#enabled = 1

let g:ale_python_pylint_executable = 'pylint3'

nmap <silent> <leader>ge <Plug>(ale_next_wrap)
nmap <silent> <leader>gE <Plug>(ale_previous_wrap)
map <leader>te :NERDTreeToggle<CR>


"" Python line length hint
"augroup vimrc_autocmds
	"autocmd!
	"" highlight characters past column 120 for python
	"autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
	"autocmd FileType python match Excess /\%120v.*/
	"autocmd FileType python set nowrap
"augroup END

""" cpp line length hint
"augroup vimrc_autocmds
	"autocmd!
	"" highlight characters past column 120 for python
	"autocmd FileType cpp highlight Excess ctermbg=DarkGrey guibg=Black
	"autocmd FileType cpp match Excess /\%120v.*/
	"autocmd FileType python set nowrap
"augroup END

set nocompatible              " be iMproved, required
filetype off                  " required
set shell=bash		      " Needed by Vundle if using fish 
"setlocal foldmethod=syntax

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

" Map 0 to fist non blank character
" noremap 0 ^
" noremap ^ 0

" Jump to beginning and end of lines easier. From http://vimbits.com/bits/16
noremap H ^
noremap L $

" Quick escape route
inoremap jk <Esc>
inoremap kj <Esc>
inoremap jK <Esc>
inoremap kJ <Esc>
inoremap Jk <Esc>
inoremap Kj <Esc>
inoremap JK <Esc>
inoremap KJ <Esc>

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

" More natural split opening
set splitbelow
set splitright

" Set up the swap, backup and undo to go to certain folders
" set backupdir=/home/sean/.vim/backup/
" set directory=/home/sean/.vim/swap/
" set undodir=/home/sean/.vim/undo/

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"let maplocalleader = ","
"let g:maplocalleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gui specific options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guioptions-=m  "no menu bar
set guioptions-=T  "no toolbar
set guioptions-=r  "no right scrollbar
set guioptions-=L  "no left scrollbar

let g:mapleader = " "


" Show the correct cursor type when using konsole
" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
Plugin 'JuliaLang/julia-vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'scrooloose/nerdcommenter'
Plugin 'lervag/vimtex'
Plugin 'dag/vim-fish'
" Plugin 'Shougu/unite.vim'
Plugin 'rafaqz/citation.vim'

" All Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Pathogen load
" filetype off
" 
" call pathogen#infect()
" call pathogen#helptags()
" 
" filetype plugin indent on
" syntax on
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin specific options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set spell spelllang=en_gb
autocmd FileType plaintex,tex,latex setlocal spell spelllang=en_gb

" Setting up solarized color scheme
if has('gui_running')
	"syntax enable
	"set background=dark
	"colorscheme solarized
        "set noantialias
        syntax enable
        set background=dark
        colorscheme Tomorrow-Night
        "colorscheme base16-tomorrow
else
        " To use solarized, uncomment the following 4 lines
        "syntax enable
        "set background=dark
        "set t_Co=256
        "colorscheme solarized
        syntax enable
        set background=dark
        "set t_Co=256
        "let base16colorspace=256
        "colorscheme base16-tomorrow
        colorscheme Tomorrow-Night
endif

" Map F2 to NERDTree toggle
map <F2> :NERDTreeToggle<CR>

"" Python line length hint
augroup vimrc_autocmds
	autocmd!
	" highlight characters past column 120 for python
	autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
	autocmd FileType python match Excess /\%120v.*/
	autocmd FileType python set nowrap
augroup END

" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator
" modes)
" ]]            Jump on next class or function (normal, visual, operator
" modes)
" [M            Jump on previous class or method (normal, visual, operator
" modes)
" ]M            Jump on next class or method (normal, visual, operator
" modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
" let g:pymode_doc_key = 'K'

" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_auto = 1
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Other Options
let g:pymode_trim_whitespaces = 1

" Jedi VIm 
let g:jedi#show_call_signatures = "2"

" Auto-format python code
noremap <F3> :Autoformat<CR><CR>

" Latex-to-Unicode as you type in Julia
let g:latex_to_unicode_auto = 1

" citation.vim zotero citations
let g:citation_vim_mode="zotero"
let g:citation_vim_zotero_path="/home/sean/.zotero/zotero/vzf14b15.default/zotero/"

let g:citation_vim_cache_path="/home/sean/.vim/your_cache_path"

let g:citation_vim_outer_prefix="\cite{"
let g:citation_vim_inner_prefix=""
let g:citation_vim_suffix="}"

let g:citation_vim_et_al_limit=2
nnoremap <silent>[unite]c       :<C-u>Unite -buffer-name=citation -start-insert -default-action=append      citation/key<cr>


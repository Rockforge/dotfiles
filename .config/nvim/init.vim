""" General Behavior
set number         " Show line numbers
set wrap           " Wrap lines
set encoding=utf-8 " Set encoding to UTF-8
set mouse=a        " Enable mouse support
set wildmenu       " Visual autocomplete for command menu
set lazyredraw     " Redraw the screen only when we need to
set showmatch      " Highlight matching parenthesis / brackets
set laststatus=2   " Always show statusline
set ruler          " Show line and column number of the cursor on the right side of the status
set visualbell     " Blink cursor on error, instead of beeping
set hidden
set updatetime=300
set nobackup
set nowritebackup
set cmdheight=2
set shortmess+=c



""" Tab Settings
set tabstop=4      " Width that a <TAB> character displays as
set expandtab      " Convert <TAB> key-presses to spaces
set shiftwidth=4   " Number of spaces to use for each step of (auto)indent
set softtabstop=4  " Backspace after pressing <TAB> will remove up to this many spaces
set autoindent     " Copy indent from current line when starting a new line
set smartindent    " Even better autoindent

""" Search Settings
set incsearch      " Search characters as entered
set hlsearch       " Highlight matches


syntax enable
filetype plugin indent on

autocmd BufWritePre * %s/\s\+$//e    " Remove whitespace when buffer is written


let mapleader=' '

nnoremap ; :

inoremap fd <Esc>

nmap <leader>fs :w<CR>

""" Split bindings
nnoremap <leader>wj <C-W><C-J>
nnoremap <leader>wk <C-W><C-K>
nnoremap <leader>wl <C-W><C-L>
nnoremap <leader>wh <C-W><C-H>
nmap <silent> <leader>wv :vsplit<CR>:wincmd l<CR>
nmap <silent> <leader>wx :split<CR>:wincmd j<CR>
nmap <silent> <leader>wo :only<CR>

""" Copy and Pasting
" Uses PRIMARY
noremap <leader>y "*y
noremap <leader>p "*p

" Uses CLIPBOARD
noremap <leader>Y "+y
noremap <leader>P "+p


call plug#begin(stdpath('data').'/plugged')

Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

call plug#end()





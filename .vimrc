" General Behavior
set nocompatible
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
set cursorline     " Show the cursor line
set tags=./tags,tags
set signcolumn=yes
" set showtabline=2  " Always show tabline

" Tab Settings
set tabstop=4      " Width that a <TAB> character displays as
set expandtab      " Convert <TAB> key-presses to spaces
set shiftwidth=4   " Number of spaces to use for each step of (auto)indent
set softtabstop=4  " Backspace after pressing <TAB> will remove up to this many spaces
set autoindent     " Copy indent from current line when starting a new line
set smartindent    " Even better autoindent

" Search Settings
set incsearch      " Search characters as entered
set hlsearch       " Highlight matches
set ignorecase     " Ignore case when searching

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Show these characters
set listchars=tab:>·
set list

" Set a color on this particular column
set colorcolumn=79

syntax enable
filetype plugin indent on

" Autocommands
autocmd BufWritePre * %s/\s\+$//e    " Remove whitespace when buffer is written

" Set leader key
let mapleader=','

nnoremap ; :
inoremap fd <Esc>
nmap <leader>fs :w<CR>

" Split bindings
nnoremap <leader>wj <C-W><C-J>
nnoremap <leader>wk <C-W><C-K>
nnoremap <leader>wl <C-W><C-L>
nnoremap <leader>wh <C-W><C-H>
nnoremap <silent> <leader>wv :vsplit<CR>:wincmd l<CR>
nnoremap <silent> <leader>wx :split<CR>:wincmd j<CR>
nnoremap <silent> <leader>wo :only<CR>

" Plugins
call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'

"Plug 'easymotion/vim-easymotion'
call plug#end()

""" NERDTree configuration
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>ft :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>

""" IdeaVIM related configs
set ideajoin
set ideastatusicon=gray
set idearefactormode=keep
"set easymotion
set NERDTree
" mappings and options that exist only in IdeaVim
map <leader>pf <Action>(GotoFile)
map <leader>bb <Action>(Switcher)
map <leader>gg <Action>(FindInPath)

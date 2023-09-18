" General Behavior
" set nocompatible  -   No longer required for nvim
" set showtabline=2 -  Always show tabline

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

filetype plugin indent on
syntax enable

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
call plug#begin(stdpath('data').'/plugged')
" Tim Pope-ru plugins yo
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'

" Just have emmet here bro
Plug 'mattn/emmet-vim'

""" Fuzzy finder
" Install fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
" Then, install the plugin itself
Plug 'junegunn/fzf.vim'

" Themes
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'

" Completion framework
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Filetree/Project management
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

" Coding stuff
Plug 'editorconfig/editorconfig-vim'

" Status line
Plug 'itchyny/lightline.vim'
call plug#end()

""" Colorscheme configuration
autocmd vimenter * ++nested colorscheme gruvbox

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

""" Completion related
" Install these global extensions for COC (Completion)
let g:coc_global_extensions = ['coc-html', 'coc-css', 'coc-jedi', 'coc-tsserver', 'coc-json', 'coc-git']

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" use <c-space>for trigger completion
" Some terminals may send <NUL> when you press <c-space>, so you could instead:
inoremap <silent><expr> <NUL> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show the Coc diagnoistics
nmap <leader>d :CocDiagnostics<CR>

""" FZF and other configurations
" Hide preview window by default
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']
" If searched in FZF, then jump to buffer if it exists
let g:fzf_buffers_jump = 1
" Popup window (anchored to the bottom of the current window)
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }

" NOTE: Check the .zshrc/.bashrc file for 'export FZF_DEFAULT_COMMAND'
nnoremap <leader>ff :Files<CR>

nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>bl :BLines<CR>

" Git commands
nnoremap <leader>gg :Git<CR>
nnoremap <leader>gf :GitFiles<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gc :Commits<CR>

" Grepping commands
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>ag :Ag<CR>

""" Lightline configuration
let g:lightline = {
            \ 'colorscheme': 'powerline',
            \ 'active': {
                \   'left': [ [ 'mode', 'paste' ],
                \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
                \ },
                \ 'component_function': {
                    \   'gitbranch': 'FugitiveHead',
                    \   'cocstatus': 'coc#status'
                    \ },
                    \ }
" Integration with CoC
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

""" NERDTree configuration
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>ft :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>

""" CtrlP configuration
" If such an executable, such as Rg is found
" Then, do these nonsense below
if executable('rg')
    " Run rg command with these options
    let g:ctrlp_user_command= 'rg %s --files --color=never'
    let g:ctrlp_use_caching = 0
endif

nnoremap <leader>pf :CtrlP<CR>


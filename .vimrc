" Installation:
" 1. Install Vim-Plug:
"    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 2. Copy this file to ~/.vimrc
" 3. Run :PlugInstall in Vim
" 4. Restart Vim

let g:mapleader = "\<Space>"

" ============================================================================
" Plugin Management
" ============================================================================

call plug#begin('~/.vim/plugged')

" Core Functionality
Plug 'preservim/nerdtree'                                " File explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " Fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'                              " Comment toggling
Plug 'tpope/vim-surround'                                " Surround text objects
Plug 'jiangmiao/auto-pairs'                              " Auto-close brackets

" Development Tools
Plug 'neoclide/coc.nvim', {'branch': 'release'}         " LSP (intellisense)
Plug 'dense-analysis/ale'                                " Linting & formatting
Plug 'tpope/vim-fugitive'                                " Git integration
Plug 'airblade/vim-gitgutter'                            " Git diff markers
Plug 'github/copilot.vim'                                " AI pair programming

" UI Enhancement
Plug 'vim-airline/vim-airline'                           " Status bar
Plug 'morhetz/gruvbox'                                   " Color scheme

" Language Support
Plug 'sheerun/vim-polyglot'                              " Syntax highlighting

call plug#end()

" ============================================================================
" Plugin Configuration
" ============================================================================

" NERDTree
nnoremap <leader>e :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1

" FZF
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
let g:fzf_layout = { 'down': '40%' }

" ALE - Linting and Formatting
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1

let g:ale_linters = {
\   'python': ['ruff', 'mypy'],
\   'rust': ['cargo', 'analyzer'],
\   'cpp': ['clangd'],
\}

let g:ale_fixers = {
\   'python': ['ruff', 'black'],
\   'rust': ['rustfmt'],
\   'cpp': ['clang-format'],
\}

" Navigate errors
nmap <silent> [e <Plug>(ale_previous_wrap)
nmap <silent> ]e <Plug>(ale_next_wrap)

" CoC - Language Server Protocol
let g:coc_global_extensions = [
\ 'coc-pyright',
\ 'coc-rust-analyzer',
\ 'coc-clangd',
\ 'coc-json',
\]

" Tab completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Accept completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Rename symbol
nmap <leader>rn <Plug>(coc-rename)

" Format code
nmap <leader>cf <Plug>(coc-format)

" Code actions
nmap <leader>ca <Plug>(coc-codeaction-cursor)
vmap <leader>ca <Plug>(coc-codeaction-selected)

" GitHub Copilot
let g:copilot_enabled = 1
let g:copilot_no_tab_map = v:true
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
imap <C-\> <Plug>(copilot-next)

" Git Integration
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gd :Gdiffsplit<CR>

" GitGutter
let g:gitgutter_enabled = 1
set updatetime=100
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap <leader>hp <Plug>(GitGutterPreviewHunk)
nmap <leader>hs <Plug>(GitGutterStageHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)

" Color Scheme
colorscheme gruvbox
set background=dark

" Auto-pairs
let g:AutoPairsMapCR = 0

" ============================================================================
" Core Settings
" ============================================================================

" Display
syntax on
set number relativenumber
set ruler
set cursorline
set showcmd
set laststatus=2
set title
set wrap linebreak
set scrolloff=8
set signcolumn=yes

" Encoding
set encoding=utf-8
set fileencoding=utf-8

" Indentation
filetype plugin indent on
set expandtab
set smarttab
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <leader>h :nohlsearch<CR>

" Editing
set backspace=indent,eol,start
set clipboard=unnamed
set mouse=a
set autowrite
set hidden

" Performance
set lazyredraw
set ttyfast

" Backup and Undo
set nobackup
set nowritebackup
set noswapfile
set undofile
set undodir=~/.vim/undodir
if !isdirectory(expand('~/.vim/undodir'))
  call mkdir(expand('~/.vim/undodir'), 'p')
endif

" Completion
set completeopt=menuone,noinsert,noselect
set shortmess+=c

" ============================================================================
" Language-Specific Settings
" ============================================================================

" Python
autocmd FileType python setlocal colorcolumn=88
autocmd FileType python setlocal textwidth=88

" Rust
autocmd FileType rust setlocal colorcolumn=100
autocmd FileType rust setlocal textwidth=100

" C++
autocmd FileType cpp setlocal colorcolumn=80
autocmd FileType cpp setlocal textwidth=80
autocmd FileType cpp setlocal commentstring=//\ %s

" ============================================================================
" Key Mappings
" ============================================================================

" Window Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Window Management
nnoremap <leader>ws :split<CR>
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wc :close<CR>
nnoremap <leader>wo :only<CR>

" Buffer Management
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

" Terminal
nnoremap <leader>t :terminal<CR>
tnoremap <Esc> <C-\><C-n>

" Quick Save
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Better indentation
vnoremap < <gv
vnoremap > >gv

" ============================================================================
" Performance Optimizations
" ============================================================================

" Disable unused built-in plugins
let g:loaded_gzip = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_2html_plugin = 1
let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_logiPat = 1
let g:loaded_rrhelper = 1
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1

" ============================================================================
" Status Line (if airline is slow, use this instead)
" ============================================================================

" Uncomment to use minimal built-in statusline instead of airline
" set statusline=%f\ %m%r%h%w\ [%{&ff}]\ %y\ [%p%%]\ [L:%l/%L,C:%c]

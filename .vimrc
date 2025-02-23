" Vim-Plug 

""
" Installation notes
" 1. Install Vim-Plug. On a Unix system, the command is:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" 2. Add the following lines to your .vimrc file
" 3. Run :PlugInstall in Vim to install the plugins
" 4. You may need to install ctags for the tagbar plugin. On an OSX, it is brew install ctags
" 5. Restart Vim
""

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'  " File explorer
Plug 'tpope/vim-surround'  " Better text editing
Plug 'jiangmiao/auto-pairs' " Auto close brackets and quotes
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
Plug 'junegunn/fzf.vim'    " Integration for fuzzy finder
Plug 'tpope/vim-commentary' " Toggle comments easily
Plug 'vim-airline/vim-airline' " Status bar
Plug 'sheerun/vim-polyglot' " Syntax highlighting for many languages
Plug 'tpope/vim-fugitive' " Git Integration
Plug 'dense-analysis/ale' " Linting and formatting
Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP
Plug 'github/copilot.vim' " Copilot
Plug 'vimwiki/vimwiki' "Notes and documentation
Plug 'luochen1990/rainbow'
Plug 'jpalardy/vim-slime' "REPL integration
Plug 'airblade/vim-gitgutter' " GitGutter
Plug 'majutsushi/tagbar' " Tagbar
Plug 'ctrlpvim/ctrlp.vim' " CtrlP
Plug 'junegunn/vim-pseudocl' " Pseudo-color highlighting
Plug 'junegunn/vim-oblique' " Oblique strategies
Plug 'junegunn/vim-github-dashboard' " GitHub dashboard
Plug 'junegunn/vim-emoji' " Emoji support
Plug 'mzlogin/vim-markdown-toc' " Markdown TOC generator
Plug 'morhetz/gruvbox'
Plug 'junegunn/gv.vim' " Git commit browser
Plug 'junegunn/vim-easy-align' " Easy alignment

call plug#end()

" Plugin Settings

"" NERDTree
nnoremap <leader>te :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

"" Window Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"" Terminal Navigation
nnoremap <leader>tt :terminal<CR>


"" Fuzzy Find File Search
nnoremap <leader>fs :Files<CR>

"" ALE Configurations
""" Lint only with explicitly configured linters
let g:ale_linters_explicit = 1

""" Run linting on save (disable if you want to lint more frequently)
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'

""" Configure linters for each language
let g:ale_linters = {
\   'python': ['flake8'],
\   'cpp': ['clangtidy'],
\   'rust': ['cargo'],
\   'ocaml': ['merlin'],
\   'sh': ['shellcheck'],
\}

""" Configure fixers (formatters)
let g:ale_fixers = {
\   'python': ['black'],
\   'cpp': ['clang-format'],
\   'rust': ['rustfmt'],
\   'ocaml': ['ocamlformat'],
\   'sh': ['shfmt'],
\}

" Auto-fix (format) on save
let g:ale_fix_on_save = 1

"" CoC Configurations
""" Global extensions for your languages
let g:coc_global_extensions = [
\ 'coc-pyright',
\ 'coc-clangd',
\ 'coc-rust-analyzer',
\ 'coc-sh',
\ 'coc-json',
\ 'coc-yaml',
\ ]

""" (Optional) Example: Use <Tab> for completion when popup menu is visible
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

"" Copilot

""" Disable default Tab mapping
" let g:copilot_no_tab_map = v:true

""" Map <C-l> to accept Copilot suggestions in Insert mode
" inoremap <silent><script><expr> <C-l> copilot#Accept("\<CR>")

"" VimWiki
""" Keep markdown notes in ~/vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

"" GitGutter
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_highlight_lines = 0
set updatetime=100 " Faster git updates

"" Tagbar
nnoremap <leader>tb :TagbarToggle<CR>

"" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"" Colorscheme
colorscheme gruvbox
set background=dark

" Basic Settings 
set nocompatible " Prevents bugs 
set number " Line numbers
set relativenumber "Relative line numbers
set autoindent " Enable auto-indent 
set smartindent " Reacts to syntax 
set tabstop=4 " Number of spaces in a tab 
set shiftwidth=4 " Number of spaces for auto-indent 
set expandtab " Set tabs to spaces 
set cursorline " Highlight current line
set wrap " Enable line wrapping
set ignorecase " Case-insensitive search 
set smartcase " Case sensitive when search starts with an uppercase 
set incsearch " Show search matches as you type 
set hlsearch " Highlight all search matches 
set mouse=a " Enable mouse support
set clipboard=unnamed " Use system clipboard
set backspace=indent,eol,start " Better backspacing
set encoding=utf-8 "Set encoding
set ruler " Better cursor 
set autowrite " Automatically save file changes
set smarttab " Smart tabbing
set spell " Spelling
set title 
set showcmd "Show leader key 

" Coding experience
set history=50
set matchtime=2

syntax enable
filetype plugin indent on
filetype indent on
let g:rainbow_active = 1
" for all buffers
let g:slime_target = "kitty"

" and/or as a buffer-level override
" let b:slime_target = "wezterm"

" Emojis
""" Emojis as GitGutter symbols
let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
let g:gitgutter_sign_modified_removed = emoji#for('collision')

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"Image Paste
autocmd FileType markdown,tex nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'

function! g:LatexPasteImage(relpath)
    execute "normal! i\\includegraphics{" . a:relpath . "}\r\\caption{I"
    let ipos = getcurpos()
    execute "normal! a" . "mage}"
    call setpos('.', ipos)
    execute "normal! ve\<C-g>"
endfunction

autocmd FileType markdown let g:PasteImageFunction = 'g:MarkdownPasteImage'
autocmd FileType tex let g:PasteImageFunction = 'g:LatexPasteImage'

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

let g:mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')

" --- put this above Plug 'jiangmiao/auto-pairs' ---
let g:AutoPairsMapCR = 0

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
Plug 'puremourning/vimspector'
Plug 'chrisbra/csv.vim'
Plug 'elzr/vim-json'
Plug 'liuchengxu/vim-which-key'
Plug 'mhinz/vim-startify'
Plug 'mbbill/undotree'


call plug#end()

" Plugin Settings

" UndoTree
set undofile
if !isdirectory(expand('~/.vim/undodir'))
  call mkdir(expand('~/.vim/undodir'), 'p')
endif
set undodir=~/.vim/undodir
nnoremap <leader>u :UndotreeToggle<CR>

" NERDTree
nnoremap <leader>ee :NERDTreeToggle<CR>
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

inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

"" Copilot
""" Default is off
let g:copilot_enabled = 0

" Prevent Copilot from mapping Tab by default
let g:copilot_no_tab_map = v:true

" Use Tab to accept Copilot suggestion (only if it's visible)
imap <silent><script><expr> <Tab> copilot#Accept("\<Tab>")

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
syntax on
filetype plugin indent on
set nocompatible         " Make Vim not behave like the original Vi
set encoding=utf-8       " Set UTF-8 encoding

" Line Numbers
set number               " Show line numbers
set relativenumber       " Show relative numbers
set ruler                " Show cursor position

" Tabs & Indentation
set expandtab            " Convert tabs to spaces
set smarttab             " Enable smart tab
set autoindent           " Auto-indent new lines
set smartindent          " Smarter auto-indenting
set tabstop=4            " Show tabs as 4 spaces
set shiftwidth=4         " Auto-indent uses 4 spaces

" Wrapping & Scrolling
set wrap                 " Wrap long lines
set linebreak            " Wrap lines at convenient points

" Search Behavior
set ignorecase           " Case-insensitive search...
set smartcase            " ...unless uppercase used
set incsearch            " Show matches as you type
set hlsearch             " Highlight search results

" Clipboard & Mouse
set clipboard=unnamed " Use system clipboard
set mouse=a               " Enable mouse support

" Quality-of-life
set backspace=indent,eol,start
set cursorline            " Highlight current line
set autowrite             " Auto-save before certain actions
set title                 " Show title in window
set showcmd               " Show typed command in status bar
set spell                 " Enable spellcheck
set history=50            " Command history size
set matchtime=2           " Show matching parens for 0.2s

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
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '≠'  " Not equal = modified & removed

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

" Debugger
" Enable vimspector
let g:vimspector_enable_mappings = 'HUMAN'

" Key mappings for debugging
nnoremap <leader>dd :call vimspector#Launch()<CR>  " Start debugging
nnoremap <leader>de :call vimspector#Reset()<CR>   " Stop debugging
nnoremap <leader>dc :call vimspector#Continue()<CR> " Continue execution
nnoremap <leader>db :call vimspector#ToggleBreakpoint()<CR> " Toggle breakpoint
nnoremap <leader>dn :call vimspector#StepOver()<CR> " Step over
nnoremap <leader>di :call vimspector#StepInto()<CR> " Step into
nnoremap <leader>do :call vimspector#StepOut()<CR> " Step out
nnoremap <leader>dv :call vimspector#Evaluate()<CR> " Evaluate expression

" Display debug windows
nnoremap <leader>dw :VimspectorWatch<CR>
nnoremap <leader>dl :VimspectorShowOutput<CR>

" Automatically open debug windows
let g:vimspector_install_gadgets = [ 'debugpy', 'CodeLLDB' ]

" Set colorcolumn for different filetypes
autocmd FileType python setlocal colorcolumn=79
autocmd FileType * if &filetype != 'python' | setlocal colorcolumn=80 | endif

" Make the colorcolumn a thin, light grey line
highlight ColorColumn ctermbg=lightgrey guibg=#ECECEC

" Launch Preview (OSX) when Vim opens a PNG file
autocmd BufReadPost *.png,*.jpg,*.jpeg,*.gif silent !open -a Preview "%:p" &

" Enable JSON filetype detection
autocmd BufRead,BufNewFile *.json set filetype=json

" vim-json settings
autocmd FileType json setlocal conceallevel=0    " Disable concealing (default hides quotes)
autocmd FileType json setlocal tabstop=2 shiftwidth=2 expandtab

let g:vim_json_syntax_conceal = 0  " Disable syntax concealing
let g:vim_json_conceal = 0         " Ensure JSON keys and values are fully visible

" Opam Settings
set rtp^="/Users/yokurang/.opam/default/share/ocp-indent/vimr"
let g:opamshare = substitute(system('opam var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" Terminal Settings

nnoremap <leader>tr :terminal<CR>

let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   Recent Files']       },
    \ { 'type': 'dir',       'header': ['   Files in Current Dir'] },
    \ { 'type': 'sessions',  'header': ['   Sessions']           },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']          },
    \ { 'type': 'commands',  'header': ['   Commands']           },
    \ ]
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [
  \ { 'c': '~/.vimrc' },
  \ { 'z': '~/vimwiki/index.md' },
  \ ]

let g:startify_custom_header = [
\ '           .--.         .---.        .-.      ',
\ '      .-(    ).     .-(     ).    .-(   ).    ',
\ '     (___.__)__)   (___.__)__)  (___.__)__)   ',
\ '     ´´´´´´´´´´´   ´´´´´´´´´´´  ´´´´´´´´´´´    ',
\ '       ´´´´´´´´´´´  ´´´´´´´´´´´   ´´´´´´´´´´   ',
\ '        ´´´´´´´´´    ´´´´´´´´´     ´´´´´´´     ',
\ '                                               ',
\ '      /\\           /\\        /\\    /\\      ',
\ '     /  \\    /\\  /  \\  /\\  /  \\  /  \\     ',
\ '    /    \\  /  \\/    \\/  \\/    \\/    \\    ',
\ '   /      \\/                    /      \\   ',
\ '  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    ',
\ '   ~    ~    ~   ~   ~   ~   ~   ~   ~   ~     ',
\ ' ~    ~   ~    ~   ~   ~    ~  ~  ~    ~   ~   ',
\ ]

let g:which_key_map = {}
let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : [':resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : [':resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }

set timeoutlen=500
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" vim-slime (REPL send)
nnoremap <silent> <leader>sl <Plug>SlimeLineSend     " send current line
vnoremap <silent> <leader>sr <Plug>SlimeRegionSend   " send visual selection

" vim-gitgutter (hunk navigation & staging)
nnoremap <silent> ]h :GitGutterNextHunk<CR>
nnoremap <silent> [h :GitGutterPrevHunk<CR>
nnoremap <silent> <leader>hs :GitGutterStageHunk<CR>
nnoremap <silent> <leader>hu :GitGutterUndoHunk<CR>

" vim-oblique (Oblique Strategies)
nnoremap <silent> <leader>ob :Oblique<CR>

" vim-github-dashboard
nnoremap <silent> <leader>gh :GitHubDashboard<CR>

" vim-emoji
nnoremap <silent> <leader>ei :Emoji<CR>

" markdown-toc
nnoremap <silent> <leader>mt :GenTocGFM<CR>

" gv.vim (Git commit browser)
nnoremap <silent> <leader>gv :GV<CR>

" csv.vim
nnoremap <silent> <leader>co :CSVOpen<CR>
nnoremap <silent> <leader>ca :CSVAlign<CR>

" JSON formatting (requires `jq` installed)
autocmd FileType json nnoremap <buffer> <silent> <leader>jf :%!jq .<CR>

" vim-startify
nnoremap <silent> <leader>as :Startify<CR>

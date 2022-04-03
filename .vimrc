" Basic front-end development config compatible with vim and nvim

"""" sets 
set nocompatible
set nobackup
set nowritebackup
set noswapfile
set number relativenumber
set backspace=indent,eol,start
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set nowrap
set incsearch
set smartcase
set showcmd
set showmode
set showmatch
set cursorline
set hlsearch
set history=1000
set mouse=a
set wildmenu
set wildmode=list:longest
set wildignore+=**/.git/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*

filetype on
filetype plugin on
filetype indent on
syntax on

"""" plugins
call plug#begin()
    " The basics
    Plug 'tpope/vim-surround'
    Plug 'kshenoy/vim-signature'
    Plug 'tpope/vim-eunuch'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'christoomey/vim-tmux-navigator'

    " Code utils
    Plug 'tpope/vim-commentary'
    Plug 'editorconfig/editorconfig-vim'

    " Writing
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'

    " Git
    Plug 'tpope/vim-fugitive'

    " Autocomplete
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
   
    " FrontEnd code
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

    " Appareance
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'arcticicestudio/nord-vim'
call plug#end()

"""" plugin config
let g:coc_global_extensions = [
  \ 'coc-marketplace',
  \ 'coc-tsserver',
  \ 'coc-cssmodules',
  \ 'coc-lists',
  \ 'coc-snippets',
  \ 'coc-explorer']

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/tslint')
  let g:coc_global_extensions += ['coc-tslint']
endif

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 66
let g:nord_contrast = v:false
let g:nord_borders = v:false
let g:nord_disable_background = v:true
let g:nord_italic = v:true

"""" mappings
let mapleader=" "
nnoremap n nzz
nnoremap N Nzz
nnoremap Y y$
nnoremap <c-p> :GFiles<CR>
nnoremap <c-a> :Ag<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)	

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>e :CocCommand explorer<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>

" Enter expands the selected suggestion
inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" :  "\<CR>"
" Tab expands the first suggestion
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>\<C-y>" : "\<TAB>"
" Navigate with Ctri K and Ctrl J
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'

"""" colorscheme activation
let g:airline_theme='nord'
colorscheme nord
" Fix color-scheme
hi! CocErrorHighlight ctermfg=white guifg=#ffffff

"""" Commands to execute for Conquer of completion
" :CocConfig 
"{
"    "coc.preferences.formatOnSaveFiletypes": [
"    "javascript",
"    "javascriptreact","
"    "typescript",
"    "typescriptreact"
"  ],
"  "tsserver.formatOnType": true,
"  "coc.preferences.formatOnType": true,
"  "explorer.file.showHiddenFiles":true
"}

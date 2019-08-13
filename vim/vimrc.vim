" Plugin management
  so ~/dotfiles/vim/plugins.vim

" General Vim settings
	syntax on
 	let mapleader=","
	set autoindent
	set tabstop=4
	set shiftwidth=4
	set expandtab
	set dir=/tmp/
	set relativenumber
	set number

	autocmd Filetype html setlocal sw=2 expandtab
	autocmd Filetype javascript setlocal sw=2 expandtab

	set cursorline
	hi Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold

	set hlsearch
	nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>
	nnoremap <C-c> :set norelativenumber<CR>:set nonumber<CR>:echo "Line numbers turned off."<CR>
	nnoremap <C-n> :set relativenumber<CR>:set number<CR>:echo "Line numbers turned on."<CR>

	nnoremap n nzzzv
	nnoremap N Nzzzv

	nnoremap H 0
	nnoremap L $
	nnoremap J G
	nnoremap K gg

	map <tab> %

	set backspace=indent,eol,start

	nnoremap <Space> za
	nnoremap <leader>z zMzvzz

	nnoremap vv 0v$

	set listchars=tab:\|\
	nnoremap <leader><tab> :set list!<cr>
	set pastetoggle=<F2>
	set mouse=a
	set incsearch

" File and Window Management
	inoremap <leader>w <Esc>:w<CR>
	nnoremap <leader>w :w<CR>

	inoremap <leader>q <ESC>:q<CR>
	nnoremap <leader>q :q<CR>

	inoremap <leader>x <ESC>:x<CR>
	nnoremap <leader>x :x<CR>

	nnoremap <leader>e :Ex<CR>
	nnoremap <leader>t :tabnew<CR>:Ex<CR>
	nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
	nnoremap <leader>s :split<CR>:w<CR>:Ex<CR>

	nnoremap <leader>n :tabnext<CR>
  nnoremap <leader>p :tabprevious<CR>

" Return to the same line you left off at
	augroup line_return
		au!
		au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\	execute 'normal! g`"zvzz' |
			\ endif
	augroup END

" Auto load
	" Triger `autoread` when files changes on disk
	" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
	" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
	autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
	set autoread
	" Notification after file change
	" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
	autocmd FileChangedShellPost *
	  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Future stuff
	"Swap line
	"Insert blank below and above

" Fix for: https://github.com/fatih/vim-go/issues/1509

" Theme
set t_Co=256
colorscheme minimalist

" Use ALE as completion sources for all code.
call deoplete#custom#option('sources', {
	\ '_': ['ale'],
	\})

let g:ale_completion_enabled = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" JavaScript
let g:javascript_plugin_flow = 1

augroup javascript_folding
	au!
	au FileType javascript setlocal foldmethod=syntax
augroup END

" React config
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
" hi ReactState guifg=#C176A7
" hi ReactProps guifg=#D19A66
"hi Events ctermfg=204 guifg=#56B6C2
"hi ReduxKeywords ctermfg=204 guifg=#C678DD
"hi WebBrowser ctermfg=204 guifg=#56B6C2
"hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
"hi tsxTypeBraces guifg=#999999
"hi tsxTypes guifg=#666666
"hi tsxTagName guifg=#E06C75
"hi tsxCloseString guifg=#F99575
"hi tsxCloseTag guifg=#F99575
"hi tsxAttributeBraces guifg=#F99575
"hi tsxEqual guifg=#F99575
"hi tsxAttrib guifg=#F8BD7F cterm=italic

" Lightline
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'active': {
	\   'right': [ [ 'lineinfo' ],
	\              [ 'percent' ],
	\              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
	\ }
	\ }
set laststatus=2

" CtrlP set the root folder where vim was opened
let g:ctrlp_working_path_mode = 0


filetype plugin indent on

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'dikiaap/minimalist'
" Plugin 'pangloss/vim-javascript'
Plugin 'w0rp/ale'
" Plugin 'mxw/vim-jsx'
" Plugin 'mhartington/nvim-typescript'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'Shougo/deoplete.nvim'
Plugin 'ap/vim-css-color'
Plugin 'mileszs/ack.vim'
Plugin 'stephpy/vim-yaml'

call vundle#end()

filetype plugin indent on

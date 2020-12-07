" For compatibility with plugins
set nocompatible
filetype plugin on
syntax on

" Vim-plug
call plug#begin('~/.vim/plugged')
Plug 'vimwiki/vimwiki'
call plug#end()

" Leader
let mapleader = ","

" === VimWiki Configuration ===
let g:vimwiki_list = [{'path': '~/obs/', 'ext':'.md', 'links_space_char':'-'}]


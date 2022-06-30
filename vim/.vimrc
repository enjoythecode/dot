set number " add line numbers
set history=10000
set nocompatible " enter the current millenium
set hlsearch " highlight search
set incsearch " show match as it is written
set encoding=utf-8
set ruler " row, col, place in file and currently typed command information at the bottom left. TLDR: airline without airline
set relativenumber " make the line numberings relative for easier modification
set cursorline " highlight the line the cursor is on
set dictionary+=/usr/share/dict/words
set scrolloff=9 " keep the current line towards the center

" statusline
set statusline=%f " display filename

" automatic installation of vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'EdenEast/nightfox.nvim' " theme
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fzf that makes sure that I have the latest binary installed"
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround' " s (surrounding) as a noun
Plug 'jiangmiao/auto-pairs' " automatically adds matching pairs of parens and quotes
call plug#end()

set path+=** " enable searching subdirectiories recursively

set wildmenu " show tab completion in the command line for any command!
colorscheme nightfox

let mapleader=' '

" git shortcuts
nnoremap <leader>gs :!git status<CR>
nnoremap <leader>gc :!git commit -m "
nnoremap <leader>gp :!git push<CR>
nnoremap <leader>ga :!git add .<CR>

" window navigation (using hjkl => neio)
nnoremap <leader>tn <c-W><c-H>
nnoremap <leader>te <c-W><c-K>
nnoremap <leader>ti <c-W><c-J>
nnoremap <leader>to <c-W><c-L>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" shortcuts for find
" Open with Find/FZF (similar to ctrl-O)
" use <Enter> to open file in place of currently open
" use <CTRL-V> for vertical split
nnoremap <leader>of :Files<CR> 

" Open new file (in split)
nnoremap <leader>on :vnew<CR>
" Open Daily Note
nnoremap <leader>od :edit `sh/open_daily_note.sh`<CR> 
" Open Scratch
nnoremap <leader>os :edit ~/scratch.txt<cr>
" Open my Vimrc
nnoremap <leader>ov :vsplit $MYVIMRC<cr>
" Open alternate file (usually, the previous file)
nnoremap <leader>oa :edit #<cr>

" Source my Vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Run files
nnoremap <leader>rp :!python3 %<cr>
"" Run Last (executed command)
nnoremap <leader>rl :@:<cr>

" Clear search results
nnoremap <leader>c :noh<cr>

" Get help inside of vim
nnoremap <leader>h :h<space>


" PEP 8 indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

"Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set showcmd		" display incomplete commands

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

" Show @@@ in the last line if it is truncated.
set display=truncate

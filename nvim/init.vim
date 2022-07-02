" Highlight trailing whitespace
" Source: https://vim.fandom.com/wiki/Highlight_unwanted_spaces (scroll down
" to right before "Highlighting with the syntax command" for
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set nohidden
set number " add line numbers
set history=10000
set hlsearch " highlight search
set incsearch " show match as it is written
set encoding=utf-8
set ruler " row, col, place in file and currently typed command information at the bottom left. TLDR: airline without airline
set relativenumber " make the line numberings relative for easier modification
set cursorline " highlight the line the cursor is on
set dictionary+=/usr/share/dict/words
set scrolloff=9 " keep the current line towards the center

"Allow backspacing over everything in insert mode.
set backspace=indent,eol,start
set showcmd		" display incomplete commands
set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

" statusline
set statusline=%f " display filename

set path+=** " enable searching subdirectiories recursively
set wildmenu " show tab completion in the command line for any command!

" automatic installation of vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'EdenEast/nightfox.nvim' " theme
Plug 'navarasu/onedark.nvim' " theme
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fzf that makes sure that I have the latest binary installed"
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround' " s (surrounding) as a noun
Plug 'jiangmiao/auto-pairs' " automatically adds matching pairs of parens and quotes
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-jdtls'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

lua require("nvim-web-devicons").setup()
lua require("nvim-tree").setup()
lua require("nvim-lsp-installer").setup {automatic_installation = true}
"lua require("lspconfig").pyright.setup {}
"lua require'lspconfig'.gopls.setup{}

let g:onedark_config = {'style': 'deep'}
colorscheme onedark

let mapleader=' '

" colemak: navigate with the new locations of hjkl
" in colemak, but swap the up and right to make it right
noremap j k
noremap k j

" git shortcuts
nnoremap <leader>gs :!git status<CR>
nnoremap <leader>gc :!git commit -m "
nnoremap <leader>gp :!git push<CR>
nnoremap <leader>ga :!git add .<CR>

" window navigation (using "colemak hjkl")
nnoremap <leader>th <c-W><c-H>
nnoremap <leader>tj <c-W><c-K>
nnoremap <leader>tk <c-W><c-J>
nnoremap <leader>tl <c-W><c-L>

" nvim-tree
nnoremap <leader>tn :NvimTreeToggle<CR>
nnoremap <leader>to :NvimTreeFocus<CR>

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
" Open my .vimrc
nnoremap <leader>ov :edit $MYVIMRC<cr>
" Open my init.lua
nnoremap <leader>ol :edit ~/.config/nvim/init.lua<cr>
" Open alternate file (usually, the previous file)
nnoremap <leader>oa :edit #<cr>

" Source my Vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Run Python 3
nnoremap <leader>rp :!python3 %<cr>
" Run a command with Fzf
nnoremap <leader>rf :Commands<cr>
" Run Last (executed command)
nnoremap <leader>rl :@:<cr>

" Clear search results
nnoremap <leader>c :noh<cr>

" Get help inside of vim
nnoremap <leader>h :h<space>

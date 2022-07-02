" Highlight trailing whitespace
" Source: https://vim.fandom.com/wiki/Highlight_unwanted_spaces (scroll down
" to right before "Highlighting with the syntax command" for full block)
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

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
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'EdenEast/nightfox.nvim' " theme
Plug 'navarasu/onedark.nvim' " theme
Plug 'tpope/vim-surround' " s (surrounding) as a noun
Plug 'jiangmiao/auto-pairs' " automatically adds matching pairs of parens and quotes
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-jdtls'
Plug 'nvim-telescope/telescope.nvim'
Plug 'akinsho/toggleterm.nvim'
call plug#end()

lua require("plugins")

" let g:onedark_config = {'style': 'deep'}
colorscheme nightfox

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
nnoremap <leader>eh <c-W><c-H>
nnoremap <leader>ej <c-W><c-K>
nnoremap <leader>ek <c-W><c-J>
nnoremap <leader>el <c-W><c-L>

" nvim-tree
nnoremap <leader>tn :NvimTreeToggle<CR>
nnoremap <leader>to :NvimTreeFocus<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" TELESCOPE GOODNESS BAY-BUH!
nnoremap <leader>tt <cmd>Telescope builtin<cr>
nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>tg <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>
nnoremap <leader>tc <cmd>Telescope commands<cr>

" Open new file (in split)
nnoremap <leader>on :vnew<CR>
" Open Daily Note
nnoremap <leader>od :edit `sh/open_daily_note.sh`<CR>
" Open Scratch
nnoremap <leader>os :edit ~/scratch.txt<cr>
" Open my .vimrc
nnoremap <leader>ov :edit $MYVIMRC<cr>
" Open lua/plugins.lua
nnoremap <leader>op :edit ~/.config/nvim/lua/plugins.lua<cr>
" Open alternate file (usually, the previous file)
nnoremap <leader>oa :edit #<cr>
" toggle the terminAl (floating)
nnoremap <leader>a <cmd>ToggleTerm direction=float<CR>

" Source Vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Run Python 3
nnoremap <leader>rp :!python3 %<cr>
" Run Last (executed command)
nnoremap <leader>rl :@:<cr>
" Run Bang (command)
nnoremap <leader>rb :!

" Clear search results
nnoremap <leader>c :noh<cr>

" Terminal Quit Using <Esc>
:tnoremap <Esc> <C-\><C-n>

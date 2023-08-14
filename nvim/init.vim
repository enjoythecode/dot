" Highlight trailing whitespace
" Source: https://vim.fandom.com/wiki/Highlight_unwanted_spaces (scroll down
" to right before "Highlighting with the syntax command" for full block)
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" display a column at textwidth + 1
set colorcolumn=+1
highlight ColorColumn ctermbg=gray guibg=gray9

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
set textwidth=80


set backspace=indent,eol,start " Allow backspacing over everything in insert mode.
set showcmd			" display incomplete commands
set ttimeout		" time out for key codes

set path+=** " enable searching subdirectiories recursively
set wildmenu " show tab completion in the command line for any command!


set fillchars+=diff:╱ " for sindrets/diffview.nvim

" use tabs for indentation and do not expand it to spaces. tabs are shown
" to be 4 characters wide.
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

" show whitespaces
set list
set listchars=tab:>·

" automatic installation of vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Completion stuff
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'petertriho/cmp-git'
Plug 'crispgm/cmp-beancount'
Plug 'hrsh7th/nvim-cmp'
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'ggandor/leap.nvim'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'folke/tokyonight.nvim' " theme
Plug 'tpope/vim-surround' " s (surrounding) as a noun
Plug 'jiangmiao/auto-pairs' " automatically adds matching pairs of parens and quotes
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-jdtls'
Plug 'nvim-telescope/telescope.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'nvim-lualine/lualine.nvim'
" Install dependencies with :COQdeps, and then :COQnow to start it
Plug 'christoomey/vim-sort-motion' " gs<motion> to sort a range
Plug 'vim-scripts/ReplaceWithRegister'
call plug#end()

let g:coq_settings = { 'auto_start': 'shut-up' }

lua require("plugins")

colorscheme tokyonight-night

lua <<EOF
  -- Set up nvim-cmp.
EOF

" make gf open the file if it doesn't exist (from :h gf)
:map gf :e <cfile><CR>

let mapleader=' '

" colemak: navigate with the new locations of hjkl
" in colemak, but swap the up and right to make it right
noremap j k
noremap k j

" More undo break points in insert mode
" from https://github.com/jackfranklin/dotfiles/blob/master/nvim/maps.vim
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

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
" Easier to type. "Telescope Search"
nnoremap <leader>ts <cmd>Telescope live_grep<cr>
nnoremap <leader>tw yiw<cmd>Telescope live_grep<cr><C-r>"
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>
nnoremap <leader>tc <cmd>Telescope commands<cr>

" Open New file
nnoremap <leader>on :enew<CR>
" Open Daily Note
nnoremap <leader>od :edit `sh/open_daily_note.sh`<CR>
" Open Scratch
nnoremap <leader>os :edit ~/scratch.txt<cr>
" Open my .Vimrc
nnoremap <leader>ov :edit $MYVIMRC<cr>
" Open lua/Plugins.lua
nnoremap <leader>op :edit ~/.config/nvim/lua/plugins.lua<cr>
" Open Alternate file (usually, the previous file)
nnoremap <leader>oa :edit #<cr>

" Help
nnoremap <leader>h :h 

" toggle the terminAl (floating)
nnoremap <leader>a <cmd>ToggleTerm direction=float<CR>
" Terminal Quit Using <Esc>
:tnoremap <Esc> <C-\><C-n>

" Source Vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Makefile test
nnoremap <leader>mt :!make test<cr>

"" Run Python 3
nnoremap <leader>rp :!python3 %<cr>
" Run Last (executed command)
nnoremap <leader>rl :@:<cr>
" Run in Shell # this is more ergonomic than rb (run-bang)
nnoremap <leader>rs :!
" Run LaTeX (compile)
nnoremap <leader>rx :!pdflatex %<cr>
" Run Golang
nnoremap <leader>rg :!go run %<cr>
" Run Bash
nnoremap <leader>rb :!./%<cr>

" Clear search results
nnoremap <leader>c :noh<cr>

" diffView
nnoremap <leader>vo <cmd>DiffviewOpen<CR>
nnoremap <leader>vq <cmd>DiffviewClose<CR>
nnoremap <leader>vh <cmd>DiffviewFileHistory<CR>

" cD into places
nnoremap <leader>dd <cmd>cd ~/dot<CR>
nnoremap <leader>dr <cmd>cd ~/dot/recipes<CR>
nnoremap <leader>dh <cmd>cd ~<CR>

" around file: all of file as a text object
onoremap af :<C-u>normal! ggVG<CR>

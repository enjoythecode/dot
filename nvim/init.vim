" automatic installation of vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Completion
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'petertriho/cmp-git'
Plug 'crispgm/cmp-beancount'
Plug 'hrsh7th/nvim-cmp'
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" Treesitter / LSP / Lint / Formatter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'mfussenegger/nvim-lint'
Plug 'mhartington/formatter.nvim'
" What I use to abstract away installation of LSPs / linters / formatters
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
" What I use to automate mason commands
Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'
" Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'

" Visual
Plug 'folke/tokyonight.nvim' " theme
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'nvim-lualine/lualine.nvim'

" Moving around
Plug 'ggandor/leap.nvim'

" Miscellaneous
Plug 'jiangmiao/auto-pairs' " automatically adds matching pairs of parens and quotes
Plug 'tpope/vim-speeddating' " <C-X>/<C-A> to decrement/increment dates
Plug 'eandrju/cellular-automaton.nvim' " cool dwarf trick

" Nouns
Plug 'tpope/vim-surround' " s (surrounding) as a noun

" Verbs
" gs<motion> to sort a range
Plug 'christoomey/vim-sort-motion'
" gr<motion> to replace the without putting the old text into the default register
Plug 'vim-scripts/ReplaceWithRegister'

" Searching
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" uuhhh apparently coc.nvim with haxe LSP is easy?
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" I configure my plugins here
lua require("plugins")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" display a column at textwidth + 1
set textwidth=80
set colorcolumn=+1
highlight ColorColumn ctermbg=gray guibg=gray9

set number " add line numbers
set history=10000
set hlsearch " highlight search
set incsearch " show match as it is written
set encoding=utf-8
set relativenumber " make the line numberings relative for easier modification
set cursorline " highlight the line the cursor is on
set dictionary+=/usr/share/dict/words
set scrolloff=9 " keep the current line towards the center

set backspace=indent,eol,start " Allow backspacing over everything in insert mode.
set showcmd " display incomplete commands
set ttimeout " time out for key codes

set path+=** " enable searching subdirectiories recursively
set wildmenu " show tab completion in the command line for any command!

" use spaces for indentation
" expand tabs into 4 spaces
" show tabs as 4 characters wide
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

" show tabs as >···
set list
set listchars=tab:>·

" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlight trailing whitespace
" Source: https://vim.fandom.com/wiki/Highlight_unwanted_spaces (scroll down
" to right before "Highlighting with the syntax command" for full block)
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" LSP / Lint / Formatter
autocmd BufWritePost * FormatWrite
autocmd BufWritePost * lua require('lint').try_lint()
autocmd BufWinEnter * lua require('lint').try_lint()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme tokyonight-night

" make gf open the file if it doesn't exist (from :h gf)
:map gf :e <cfile><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=' '

" these are the Actions that I define for myself
"split from the current location (and the uppercase version to separate up)
nnoremap <leader>as i<CR><ESC><up>$
nnoremap <leader>aS i<CR><ESC>dd<up><up>p<down>$
" insert a semicolon to the end of the line without changing cursor position
" use a mark to not lose where we were
" the mark used is j, which is hard to reach in Colemak so unlikely to collide
nnoremap <leader>a; mjA;<ESC>`j
nnoremap <leader>atr :CellularAutomaton make_it_rain<CR>
nnoremap <leader>atg :CellularAutomaton game_of_life<CR>

" colemak goofiness to be able to use hjkl-keys; use them while holding Ctrl(!!)
" <C-h> already works
noremap <C-n> <Down>
noremap <C-e> <Up>
noremap <C-i> <Right>

" More undo break points in insert mode
" from https://github.com/jackfranklin/dotfiles/blob/master/nvim/maps.vim
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" shortcuts for doing stuff with `iw` (word Under the cursor)
" Telescope live_grep it. duplicated by <leader>tw
nnoremap <leader>ut yiw<cmd>Telescope live_grep<cr><C-r>"
" Search for it
nnoremap <leader>us yiw/<C-r>"<cr>
" search for it in Help
nnoremap <leader>uh yiw:h <C-r>"<cr>
" go Replace it
" note that we use nmap instead of nnoremap because gr itself is mapped to the
" ReplaceWithRegister command
nmap <leader>ur griw


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

" ZZ
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
nnoremap <leader>od :edit `~/dot/sh/open_daily_note.sh`<CR>
" Open Scratch
nnoremap <leader>os :edit ~/scratch.txt<cr>
" Open my .Vimrc
nnoremap <leader>ov :edit $MYVIMRC<cr>
" Open lua/Plugins.lua
nnoremap <leader>op :edit ~/.config/nvim/lua/plugins.lua<cr>
" Open Alternate file (usually, the previous file)
nnoremap <leader>oa :edit #<cr>
" Open Readme.md
nnoremap <leader>or :edit README.md<cr>
" Open Todo.md
nnoremap <leader>ot :edit TODO.md<cr>
" Open ultisnip snippEts for this filetype
nnoremap <leader>oe :UltiSnipsEdit<cr>

" Help
nnoremap <leader>h :h 

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
" I found myself reaching for this, therefore, I shall define it. "run test"
nnoremap <leader>rt :!make test<cr>

" Clear search results
nnoremap <leader>c :noh<cr>

" cD into places
nnoremap <leader>dd <cmd>cd ~/dot<CR>
nnoremap <leader>dr <cmd>cd ~/dot/recipes<CR>
nnoremap <leader>dh <cmd>cd ~<CR>

" around file: all of file as a text object
onoremap af :<C-u>normal! ggVG<CR>

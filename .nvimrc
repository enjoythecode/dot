version 6.0
let s:cpo_save=&cpo
set cpo&vim
imap <silent> <Plug>(cmpu-jump-backwards) =UltiSnips#JumpBackwards()
imap <silent> <Plug>(cmpu-jump-forwards) =UltiSnips#JumpForwards()
imap <silent> <Plug>(cmpu-expand) =[UltiSnips#CursorMoved(), UltiSnips#ExpandSnippet()][1]
cnoremap <silent> <Plug>(TelescopeFuzzyCommandSearch) e "lua require('telescope.builtin').command_history { default_text = [=[" . escape(getcmdline(), '"') . "]=] }"
inoremap <silent> <expr> <PageUp> coc#pum#visible() ? coc#pum#scroll(0) : "\<PageUp>"
inoremap <silent> <expr> <PageDown> coc#pum#visible() ? coc#pum#scroll(1) : "\<PageDown>"
imap <C-G>S <Plug>ISurround
imap <C-G>s <Plug>Isurround
imap <C-S> <Plug>Isurround
inoremap <silent> <SNR>16_AutoPairsReturn =AutoPairsReturn()
inoremap <silent> <C-Tab> =UltiSnips#ListSnippets()
inoremap <C-W> u
inoremap <C-U> u
xmap  <Plug>SpeedDatingUp
nmap  <Plug>SpeedDatingUp
noremap  <Up>
snoremap <silent>  "_c
xnoremap <silent> 	 :call UltiSnips#SaveLastVisualSelection()gvs
snoremap <silent> 	 :call UltiSnips#ExpandSnippet()
nmap 	 [^[:blank:]]*$
omap 	 [^[:blank:]]*$
nnoremap  <Cmd>nohlsearch|diffupdate|normal! 
noremap  <Down>
snoremap  "_c
xmap  <Plug>SpeedDatingDown
nmap  <Plug>SpeedDatingDown
nnoremap  dh <Cmd>cd ~
nnoremap  dr <Cmd>cd ~/dot/recipes
nnoremap  dd <Cmd>cd ~/dot
nnoremap  c :noh
nnoremap  rt :!make test
nnoremap  rb :!./%
nnoremap  rg :!go run %
nnoremap  rx :!pdflatex %
nnoremap  rs :!
nnoremap  rl :@:
nnoremap  rp :!python3 %
nnoremap  mt :!make test
nnoremap  sv :source $MYVIMRC
nnoremap  h :h 
nnoremap  oe :UltiSnipsEdit
nnoremap  ot :edit TODO.md
nnoremap  or :edit README.md
nnoremap  oa :edit #
nnoremap  op :edit ~/.config/nvim/lua/plugins.lua
nnoremap  ov :edit $MYVIMRC
nnoremap  os :edit ~/scratch.txt
nnoremap  od :edit `~/dot/sh/open_daily_note.sh`
nnoremap  on :enew
nnoremap  tc <Cmd>Telescope commands
nnoremap  th <Cmd>Telescope help_tags
nnoremap  tb <Cmd>Telescope buffers
nnoremap  tw yiw<Cmd>Telescope live_grep"
nnoremap  ts <Cmd>Telescope live_grep
nnoremap  tf <Cmd>Telescope find_files
nnoremap  tt <Cmd>Telescope builtin
nnoremap  q :q
nnoremap  w :w
nnoremap  el 
nnoremap  ek <NL>
nnoremap  ej 
nnoremap  eh 
nnoremap  ga :!git add .
nnoremap  gp :!git push
nnoremap  gc :!git commit -m "
nnoremap  gs :!git status
nmap  ur griw
nnoremap  uh yiw:h "
nnoremap  us yiw/"
nnoremap  ut yiw<Cmd>Telescope live_grep"
nnoremap  atg :CellularAutomaton game_of_life
nnoremap  atr :CellularAutomaton make_it_rain
nnoremap  a; mjA;`j
nnoremap  aS idd<Up><Up>p<Down>$
nnoremap  as i<Up>$
xnoremap # y?\V"
omap <silent> % <Plug>(MatchitOperationForward)
xmap <silent> % <Plug>(MatchitVisualForward)
nmap <silent> % <Plug>(MatchitNormalForward)
nnoremap & :&&
xnoremap * y/\V"
onoremap <silent> S <Plug>(leap-backward-to)
xmap S <Plug>VSurround
nnoremap <silent> S <Plug>(leap-backward-to)
onoremap <silent> X <Plug>(leap-backward-till)
xnoremap <silent> X <Plug>(leap-backward-till)
nnoremap Y y$
omap <silent> [% <Plug>(MatchitOperationMultiBackward)
xmap <silent> [% <Plug>(MatchitVisualMultiBackward)
nmap <silent> [% <Plug>(MatchitNormalMultiBackward)
omap <silent> ]% <Plug>(MatchitOperationMultiForward)
xmap <silent> ]% <Plug>(MatchitVisualMultiForward)
nmap <silent> ]% <Plug>(MatchitNormalMultiForward)
xmap a% <Plug>(MatchitVisualTextObject)
onoremap af :normal! ggVG
nmap cS <Plug>CSurround
nmap cs <Plug>Csurround
nmap ds <Plug>Dsurround
nmap d<C-X> <Plug>SpeedDatingNowLocal
nmap d <Plug>SpeedDatingNowLocal
nmap d<C-A> <Plug>SpeedDatingNowUTC
nmap d <Plug>SpeedDatingNowUTC
xmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
omap <silent> g% <Plug>(MatchitOperationBackward)
xmap <silent> g% <Plug>(MatchitVisualBackward)
nmap <silent> g% <Plug>(MatchitNormalBackward)
xmap gr <Plug>ReplaceWithRegisterVisual
nmap grr <Plug>ReplaceWithRegisterLine
nmap gr <Plug>ReplaceWithRegisterOperator
nmap gss <Plug>SortLines
xmap gS <Plug>VgSurround
map gf :e <cfile>
onoremap <silent> gs <Plug>(leap-from-window)
xnoremap <silent> gs <Plug>(leap-from-window)
nnoremap <silent> gs <Plug>(leap-from-window)
onoremap <silent> s <Plug>(leap-forward-to)
xnoremap <silent> s <Plug>(leap-forward-to)
nnoremap <silent> s <Plug>(leap-forward-to)
onoremap <silent> x <Plug>(leap-forward-till)
xnoremap <silent> x <Plug>(leap-forward-till)
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
smap <silent> <Plug>(cmpu-jump-backwards) :call UltiSnips#JumpBackwards()
smap <silent> <Plug>(cmpu-jump-forwards) :call UltiSnips#JumpForwards()
smap <silent> <Plug>(cmpu-expand) :call UltiSnips#ExpandSnippetOrJump()
xnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
xmap <silent> <Plug>(MatchitVisualTextObject) <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward)
onoremap <silent> <Plug>(MatchitOperationMultiForward) :call matchit#MultiMatch("W",  "o")
onoremap <silent> <Plug>(MatchitOperationMultiBackward) :call matchit#MultiMatch("bW", "o")
xnoremap <silent> <Plug>(MatchitVisualMultiForward) :call matchit#MultiMatch("W",  "n")m'gv``
xnoremap <silent> <Plug>(MatchitVisualMultiBackward) :call matchit#MultiMatch("bW", "n")m'gv``
nnoremap <silent> <Plug>(MatchitNormalMultiForward) :call matchit#MultiMatch("W",  "n")
nnoremap <silent> <Plug>(MatchitNormalMultiBackward) :call matchit#MultiMatch("bW", "n")
onoremap <silent> <Plug>(MatchitOperationBackward) :call matchit#Match_wrapper('',0,'o')
onoremap <silent> <Plug>(MatchitOperationForward) :call matchit#Match_wrapper('',1,'o')
xnoremap <silent> <Plug>(MatchitVisualBackward) :call matchit#Match_wrapper('',0,'v')m'gv``
xnoremap <silent> <Plug>(MatchitVisualForward) :call matchit#Match_wrapper('',1,'v'):if col("''") != col("$") | exe ":normal! m'" | endifgv``
nnoremap <silent> <Plug>(MatchitNormalBackward) :call matchit#Match_wrapper('',0,'n')
nnoremap <silent> <Plug>(MatchitNormalForward) :call matchit#Match_wrapper('',1,'n')
tnoremap <silent> <Plug>(fzf-normal) 
tnoremap <silent> <Plug>(fzf-insert) i
nnoremap <silent> <Plug>(fzf-normal) <Nop>
nnoremap <silent> <Plug>(fzf-insert) i
onoremap <silent> <Plug>(coc-classobj-a) :call CocAction('selectSymbolRange', v:false, '', ['Interface', 'Struct', 'Class'])
onoremap <silent> <Plug>(coc-classobj-i) :call CocAction('selectSymbolRange', v:true, '', ['Interface', 'Struct', 'Class'])
vnoremap <silent> <Plug>(coc-classobj-a) :call CocAction('selectSymbolRange', v:false, visualmode(), ['Interface', 'Struct', 'Class'])
vnoremap <silent> <Plug>(coc-classobj-i) :call CocAction('selectSymbolRange', v:true, visualmode(), ['Interface', 'Struct', 'Class'])
onoremap <silent> <Plug>(coc-funcobj-a) :call CocAction('selectSymbolRange', v:false, '', ['Method', 'Function'])
onoremap <silent> <Plug>(coc-funcobj-i) :call CocAction('selectSymbolRange', v:true, '', ['Method', 'Function'])
vnoremap <silent> <Plug>(coc-funcobj-a) :call CocAction('selectSymbolRange', v:false, visualmode(), ['Method', 'Function'])
vnoremap <silent> <Plug>(coc-funcobj-i) :call CocAction('selectSymbolRange', v:true, visualmode(), ['Method', 'Function'])
nnoremap <silent> <Plug>(coc-cursors-position) :call CocAction('cursorsSelect', bufnr('%'), 'position', 'n')
nnoremap <silent> <Plug>(coc-cursors-word) :call CocAction('cursorsSelect', bufnr('%'), 'word', 'n')
vnoremap <silent> <Plug>(coc-cursors-range) :call CocAction('cursorsSelect', bufnr('%'), 'range', visualmode())
nnoremap <silent> <Plug>(coc-refactor) :call       CocActionAsync('refactor')
nnoremap <silent> <Plug>(coc-command-repeat) :call       CocAction('repeatCommand')
nnoremap <silent> <Plug>(coc-float-jump) :call       coc#float#jump()
nnoremap <silent> <Plug>(coc-float-hide) :call       coc#float#close_all()
nnoremap <silent> <Plug>(coc-fix-current) :call       CocActionAsync('doQuickfix')
nnoremap <silent> <Plug>(coc-openlink) :call       CocActionAsync('openLink')
nnoremap <silent> <Plug>(coc-references-used) :call       CocActionAsync('jumpUsed')
nnoremap <silent> <Plug>(coc-references) :call       CocActionAsync('jumpReferences')
nnoremap <silent> <Plug>(coc-type-definition) :call       CocActionAsync('jumpTypeDefinition')
nnoremap <silent> <Plug>(coc-implementation) :call       CocActionAsync('jumpImplementation')
nnoremap <silent> <Plug>(coc-declaration) :call       CocActionAsync('jumpDeclaration')
nnoremap <silent> <Plug>(coc-definition) :call       CocActionAsync('jumpDefinition')
nnoremap <silent> <Plug>(coc-diagnostic-prev-error) :call       CocActionAsync('diagnosticPrevious', 'error')
nnoremap <silent> <Plug>(coc-diagnostic-next-error) :call       CocActionAsync('diagnosticNext',     'error')
nnoremap <silent> <Plug>(coc-diagnostic-prev) :call       CocActionAsync('diagnosticPrevious')
nnoremap <silent> <Plug>(coc-diagnostic-next) :call       CocActionAsync('diagnosticNext')
nnoremap <silent> <Plug>(coc-diagnostic-info) :call       CocActionAsync('diagnosticInfo')
nnoremap <silent> <Plug>(coc-format) :call       CocActionAsync('format')
nnoremap <silent> <Plug>(coc-rename) :call       CocActionAsync('rename')
nnoremap <Plug>(coc-codeaction-source) :call       CocActionAsync('codeAction', '', ['source'], v:true)
nnoremap <Plug>(coc-codeaction-refactor) :call       CocActionAsync('codeAction', 'cursor', ['refactor'], v:true)
nnoremap <Plug>(coc-codeaction-cursor) :call       CocActionAsync('codeAction', 'cursor')
nnoremap <Plug>(coc-codeaction-line) :call       CocActionAsync('codeAction', 'currline')
nnoremap <Plug>(coc-codeaction) :call       CocActionAsync('codeAction', '')
vnoremap <Plug>(coc-codeaction-refactor-selected) :call       CocActionAsync('codeAction', visualmode(), ['refactor'], v:true)
vnoremap <silent> <Plug>(coc-codeaction-selected) :call       CocActionAsync('codeAction', visualmode())
vnoremap <silent> <Plug>(coc-format-selected) :call       CocActionAsync('formatSelected', visualmode())
nnoremap <Plug>(coc-codelens-action) :call       CocActionAsync('codeLensAction')
nnoremap <Plug>(coc-range-select) :call       CocActionAsync('rangeSelect',     '', v:true)
vnoremap <silent> <Plug>(coc-range-select-backward) :call       CocActionAsync('rangeSelect',     visualmode(), v:false)
vnoremap <silent> <Plug>(coc-range-select) :call       CocActionAsync('rangeSelect',     visualmode(), v:true)
nnoremap <Plug>PlenaryTestFile :lua require('plenary.test_harness').test_file(vim.fn.expand("%:p"))
nnoremap <silent> <Plug>ReplaceWithRegisterVisual :call setline('.', getline('.'))|execute 'silent! call repeat#setreg("\<Plug>ReplaceWithRegisterVisual", v:register)'|call ReplaceWithRegister#SetRegister()|if ReplaceWithRegister#IsExprReg()|    let g:ReplaceWithRegister_expr = getreg('=')|endif|execute 'normal!' ReplaceWithRegister#VisualMode()|call ReplaceWithRegister#Operator('visual', "\<Plug>ReplaceWithRegisterVisual")
vnoremap <silent> <Plug>ReplaceWithRegisterVisual :call setline('.', getline('.'))|execute 'silent! call repeat#setreg("\<Plug>ReplaceWithRegisterVisual", v:register)'|call ReplaceWithRegister#SetRegister()|if ReplaceWithRegister#IsExprReg()|    let g:ReplaceWithRegister_expr = getreg('=')|endif|call ReplaceWithRegister#Operator('visual', "\<Plug>ReplaceWithRegisterVisual")
nnoremap <silent> <Plug>ReplaceWithRegisterLine :call setline('.', getline('.'))|execute 'silent! call repeat#setreg("\<Plug>ReplaceWithRegisterLine", v:register)'|call ReplaceWithRegister#SetRegister()|if ReplaceWithRegister#IsExprReg()|    let g:ReplaceWithRegister_expr = getreg('=')|endif|execute 'normal! V' . v:count1 . "_\<Esc>"|call ReplaceWithRegister#Operator('visual', "\<Plug>ReplaceWithRegisterLine")
nnoremap <silent> <Plug>ReplaceWithRegisterExpressionSpecial :let g:ReplaceWithRegister_expr = getreg('=')|execute 'normal!' v:count1 . '.'
nnoremap <expr> <Plug>ReplaceWithRegisterOperator ReplaceWithRegister#OperatorExpression()
nnoremap <silent> <Plug>SortLines :call sort_motion#sort_lines()
xnoremap <silent> <Plug>SortMotionVisual :call sort_motion#sort_motion(visualmode())
nnoremap <silent> <Plug>SortMotion :set opfunc=sort_motion#sort_motiong@
nnoremap <silent> <Plug>SurroundRepeat .
xmap <C-X> <Plug>SpeedDatingDown
xmap <C-A> <Plug>SpeedDatingUp
nmap <C-X> <Plug>SpeedDatingDown
nmap <C-A> <Plug>SpeedDatingUp
nnoremap <Plug>SpeedDatingFallbackDown 
nnoremap <Plug>SpeedDatingFallbackUp 
nnoremap <silent> <Plug>SpeedDatingNowUTC :call speeddating#timestamp(1,v:count)
nnoremap <silent> <Plug>SpeedDatingNowLocal :call speeddating#timestamp(0,v:count)
xnoremap <silent> <Plug>SpeedDatingDown :call speeddating#incrementvisual(-v:count1)
xnoremap <silent> <Plug>SpeedDatingUp :call speeddating#incrementvisual(v:count1)
nnoremap <silent> <Plug>SpeedDatingDown :call speeddating#increment(-v:count1)
nnoremap <silent> <Plug>SpeedDatingUp :call speeddating#increment(v:count1)
snoremap <C-R> "_c
snoremap <silent> <C-H> "_c
snoremap <silent> <Del> "_c
snoremap <silent> <BS> "_c
snoremap <silent> <C-Tab> :call UltiSnips#ListSnippets()
noremap <C-I> <Right>
noremap <C-E> <Up>
noremap <C-N> <Down>
nnoremap <C-L> <Cmd>nohlsearch|diffupdate|normal! 
imap S <Plug>ISurround
imap s <Plug>Isurround
inoremap <silent> 	 =UltiSnips#ExpandSnippet()
imap  <Plug>Isurround
inoremap  u
inoremap  u
inoremap ! !u
inoremap , ,u
inoremap . .u
inoremap ? ?u
let &cpo=s:cpo_save
unlet s:cpo_save
set dictionary=/usr/share/dict/words
set expandtab
set helplang=en
set listchars=tab:>·
set path=.,/usr/include,,,**
set runtimepath=~/.config/nvim,~/.vim/plugged/cmp-buffer,~/.vim/plugged/cmp-path,~/.vim/plugged/cmp-cmdline,~/.vim/plugged/cmp-git,~/.vim/plugged/cmp-beancount,~/.vim/plugged/nvim-cmp,~/.vim/plugged/ultisnips,~/.vim/plugged/cmp-nvim-ultisnips,~/.vim/plugged/nvim-treesitter,~/.vim/plugged/nvim-lint,~/.vim/plugged/formatter.nvim,~/.vim/plugged/mason.nvim,~/.vim/plugged/mason-lspconfig.nvim,~/.vim/plugged/mason-tool-installer.nvim,~/.vim/plugged/nvim-lspconfig,~/.vim/plugged/tokyonight.nvim,~/.vim/plugged/nvim-web-devicons,~/.vim/plugged/lualine.nvim,~/.vim/plugged/leap.nvim,~/.vim/plugged/auto-pairs,~/.vim/plugged/vim-speeddating,~/.vim/plugged/cellular-automaton.nvim,~/.vim/plugged/vim-surround,~/.vim/plugged/vim-sort-motion,~/.vim/plugged/ReplaceWithRegister,~/.vim/plugged/plenary.nvim,~/.vim/plugged/telescope.nvim,~/.vim/plugged/coc.nvim,/etc/xdg/nvim,~/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/share/nvim/runtime,/usr/share/nvim/runtime/pack/dist/opt/matchit,/usr/lib/nvim,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,~/.local/share/nvim/site/after,/etc/xdg/nvim/after,~/.config/nvim/after,~/.vim/plugged/cmp-buffer/after,~/.vim/plugged/cmp-path/after,~/.vim/plugged/cmp-cmdline/after,~/.vim/plugged/cmp-beancount/after,~/.vim/plugged/ultisnips/after,~/.vim/plugged/cmp-nvim-ultisnips/after,/usr/share/vim/vimfiles/
set scrolloff=9
set shiftwidth=4
set statusline=%#Normal#
set tabstop=4
set termguicolors
set textwidth=80
set undodir=~/.vim/undo
set undofile
set window=73
" vim: set ft=vim :

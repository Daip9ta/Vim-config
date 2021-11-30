"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ______   _______ _________ _______   _____ _________ _______ 
"(  __  \ (  ___  )\__   __/(  ____ ) / ___ \\__   __/(  ___  )
"| (  \  )| (   ) |   ) (   | (    )|( (   ) )  ) (   | (   ) |
"| |   ) || (___) |   | |   | (____)|( (___) |  | |   | (___) |
"| |   | ||  ___  |   | |   |  _____) \____  |  | |   |  ___  |
"| |   ) || (   ) |   | |   | (            ) |  | |   | (   ) |
"| (__/  )| )   ( |___) (___| )      /\____) )  | |   | )   ( |
"(______/ |/     \|\_______/|/       \______/   )_(   |/     \|
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Discord: Dai#6666
" Steam: https://steamcommunity.com/profiles/76561199071270280
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a 				" Enable mouse
set tabstop=4 				" 
set shiftwidth=4 			" 
set listchars=tab:\¦\ 		" Tab charactor 
set list
set foldmethod=indent 		" 
set foldlevelstart=99 		"  
set number 					" Show line number
set ignorecase 				" Enable case-sensitive 

" Disable backup
set nobackup
set nowb
set noswapfile
set nocompatible
syntax on

" Enable copying from vim to clipboard
if has('win32')
	set clipboard=unnamed  
else
	set clipboard=unnamedplus
endif

" Auto reload content changed outside
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
		\ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == ''
			\ | checktime 
		\ | endif
autocmd FileChangedShellPost *
		\ echohl WarningMsg 
		\ | echo "File changed on disk. Buffer reloaded."
		\ | echohl None


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Resize pane
nmap <M-Right> :vertical resize +1<CR> 		
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>

" Search a hightlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

call plug#begin(stdpath('config').'/plugged')
" Theme
"	Plug 'joshdick/onedark.vim', 					" Dark theme
"	Plug 'jacoborus/tender.vim'
	Plug 'sainnhe/sonokai' 							"themes
" File browser
	Plug 'preservim/nerdTree' 						" File browser  
	Plug 'Xuyuanp/nerdtree-git-plugin' 				" Git status
	Plug 'ryanoasis/vim-devicons' 					" Icon
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'unkiwii/vim-nerdtree-sync' 				" Sync current file 

" File search
	Plug 'junegunn/fzf', 
		\ { 'do': { -> fzf#install() } } 			" Fuzzy finder 
	Plug 'junegunn/fzf.vim'

" Status bar
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

" Terminal
	Plug 'voldikss/vim-floaterm' 					" Float terminal

" Code intellisense
	Plug 'neoclide/coc.nvim', {'branch': 'release'} " Language server 
	Plug 'jiangmiao/auto-pairs' 					" Parenthesis auto 
	Plug 'alvan/vim-closetag'
	Plug 'mattn/emmet-vim' 
	Plug 'preservim/nerdcommenter' 					" Comment code 
	Plug 'liuchengxu/vista.vim' 					" Function tag bar 
	Plug 'alvan/vim-closetag' 						" Auto close HTML/XML tag 

" Code syntax highlight
	Plug 'yuezk/vim-js' 							" Javascript
	Plug 'MaxMEllon/vim-jsx-pretty' 				" JSX/React
	Plug 'jackguo380/vim-lsp-cxx-highlight'			" C++ syntax
	Plug 'uiiaoo/java-syntax.vim' 					" Java
	Plug 'sheerun/vim-polyglot'
  
" Debugging
	Plug 'puremourning/vimspector' 					" Vimspector

" Source code version control 
	Plug 'tpope/vim-fugitive' 						" Git

"discord RPC
	Plug 'andweeb/presence.nvim'
"copilot
    Plug 'github/copilot.vim'  		                "copilot
"deoplete
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
"snippes
 	Plug 'honza/vim-snippets'
call plug#end()

colorscheme sonokai

for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
	execute 'source' setting_file
endfor

let g:presence_auto_update         = 1
let g:presence_neovim_image_text   = "The One True Text Editor"
let g:presence_main_image          = "neovim"
let g:presence_client_id           = "793271441293967371"
let g:presence_debounce_timeout    = 10
let g:presence_enable_line_number  = 0
let g:presence_blacklist           = []
let g:presence_buttons             = 1

let g:presence_editing_text        = "Editing %s"
let g:presence_file_explorer_text  = "Browsing %s"
let g:presence_git_commit_text     = "Committing changes"
let g:presence_plugin_manager_text = "Managing plugins"
let g:presence_reading_text        = "Reading %s"
let g:presence_workspace_text      = "Working on %s"
let g:presence_line_number_text    = "Line %s out of %s"

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,ruby-rails,ruby-1.9'

let g:polyglot_disabled = ['markdown']
let g:polyglot_disabled = ['autoindent']

let g:airline_powerline_fonts = 1 							" Enable font for status bar
let g:airline_theme='onedark' 								" Theme OneDark

let g:airline#extensions#tabline#enabled = 1 				" Enable Tab bar
let g:airline#extensions#tabline#left_sep = ' ' 			" Enable Tab seperator 
let g:airline#extensions#tabline#left_alt_sep = '|' 		" Enable Tab seperator
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod = ':t' 			" Set Tab name as file name

let g:airline#extensions#whitespace#enabled = 0  			" Remove warning whitespace"

set encoding=utf-8
set hidden
set nobackup
set nowritebackup

set cmdheight=1
set updatetime=300

set shortmess+=c
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endi
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"let g:floaterm_keymap_new    = '<F8>'
"let g:floaterm_keymap_prev   = '<F9>'
"let g:floaterm_keymap_next   = '<F10>'
"let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_position = 'topright'
let g:floaterm_width = 0.6
let g:floaterm_height = 0.6
let g:floaterm_title = 'Terminal $1/$2'
let g:floaterm_wintype = 'float'
let g:floaterm_rootmarkers = ['.pro']
if has('win32')
	let g:floaterm_shell = 'powershell -nologo'
endif

" Set color
hi Floaterm guibg=Grey15
hi FloatermBorder guifg=Orange guibg=DarkGreen
"hi FloatermNC guibg=darkred
nnoremap   <silent>   <leader>to    :FloatermNew<CR>
tnoremap   <silent>   <leader>to    <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> 	<leader>tk 		:FloatermKill<CR>:FloatermPrev<CR>
tnoremap <silent> 	<leader>tk 		<C-\><C-n>:FloatermKill<CR>:FloatermPrev<CR>
nnoremap <silent> 	<leader>tn 		:FloatermNext<CR>
tnoremap <silent> 	<leader>tn 		<C-\><C-n>:FloatermNext<CR>
nnoremap <silent> 	<leader>tp 		:FloatermPrev<CR>
tnoremap <silent> 	<leader>tp 		<C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> 	<leader>tt 		:FloatermToggle<CR>
tnoremap <silent> 	<leader>tt 		<C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> 	<leader>tf 		<C-\><C-n><C-W><Left>
tnoremap <silent> 	<leader>tf 		<C-\><C-n><C-W><Left>

nnoremap   <silent>   <F8>    :FloatermNew powershell<CR>
tnoremap   <silent>   <F9>    exit<CR>

" This is the default extra key bindings
let g:fzf_action = {
		\ 'ctrl-t': 'tab split',
		\ 'ctrl-x': 'split',
		\ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

hi! fzf_fg ctermfg=14
hi! fzf_fgp ctermfg=3
hi! fzf_hl ctermfg=5
hi! fzf_hlp ctermfg=5
hi! fzf_info ctermfg=6
hi! fzf_prompt ctermfg=6
hi! fzf_spinner ctermfg=6
hi! fzf_pointer ctermfg=3
let g:fzf_colors = {
		\ 'fg':      ['fg', 'fzf_fg'],
		\ 'hl':      ['fg', 'fzf_hl'],
		\ 'fg+':     ['fg', 'fzf_fgp'],
		\ 'hl+':     ['fg', 'fzf_hlp'],
		\ 'info':    ['fg', 'fzf_info'],
		\ 'prompt':  ['fg', 'fzf_prompt'],
		\ 'pointer': ['fg', 'fzf_pointer'],
		\ 'spinner': ['fg', 'fzf_spinner'] }

" :Files
command! -bang -nargs=? -complete=dir Files
   \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'bat --color=always --theme=TwoDark --style=header,numbers,snip --line-range :300 {}']}, <bang>0)
map <F6> :Files<CR> 
map <C-F6> :History<CR>

" :Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
	\   'rg --column --line-number --color=always --smart-case -- '.shellescape(<q-args>), 1, {'options': ['--exact', '--layout=reverse']}, <bang>0)
map <F7> :Rg<CR>

" History
map <C-/> :History/<CR>

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
" F5 to toggle 
map <silent> <F5> :NERDTreeToggle<CR>

" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * silent NERDTreeMirror

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Change arrow to expand/collapse tree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"let NERDTreeMapOpenInTab='<ENTER>'

" Git status icon
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" Hightlight current file
let g:nerdtree_sync_cursorline = 1

" Show the nearest function name in status bar
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
nnoremap 	<Leader>dl :call vimspector#Launch()<CR>
nnoremap 	<Leader>ds :call vimspector#Reset()<CR>
nnoremap 	<Leader>dc :call vimspector#Continue()<CR>

nnoremap 	<Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap 	<Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap 		<Leader>dr <Plug>VimspectorRestart
nmap 		<Leader>de <Plug>VimspectorStepOut
nmap 		<Leader>di <Plug>VimspectorStepInto
nmap 		<Leader>do <Plug>VimspectorStepOver

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
nnoremap <F12> :!g++ -g % -o %:r <CR>
nnoremap <F11> :term %:r.exe<CR>
" Search a hightlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin list
" (used for Vim-plug - https://github.com/junegunn/vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin(stdpath('config').'/plugged')
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
" Terminal
	Plug 'voldikss/vim-floaterm' 					" Float terminal
" Code intellisense
	Plug 'neoclide/coc.nvim', {'branch': 'release'} " Language server 
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
	Plug 'neovim/nvim-lsp' " nvim-lsp
	Plug 'prabirshrestha/vim-lsp' " vim-lsp
	Plug 'autozimu/LanguageClient-neovim' " LanguageClient-neovim
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set themes
"colorscheme sonokai

" Other setting
for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
	execute 'source' setting_file
endfor

"dis rpc
" General options
let g:presence_auto_update         = 1
let g:presence_neovim_image_text   = "The One True Text Editor"
let g:presence_main_image          = "neovim"
let g:presence_client_id           = "793271441293967371"
let g:presence_debounce_timeout    = 10
let g:presence_enable_line_number  = 0
let g:presence_blacklist           = []
let g:presence_buttons             = 1

" Rich Presence text options
let g:presence_editing_text        = "Editing %s"
let g:presence_file_explorer_text  = "Browsing %s"
let g:presence_git_commit_text     = "Committing changes"
let g:presence_plugin_manager_text = "Managing plugins"
let g:presence_reading_text        = "Reading %s"
let g:presence_workspace_text      = "Working on %s"
let g:presence_line_number_text    = "Line %s out of %s"

"snippets

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,ruby-rails,ruby-1.9'

"syntax

let g:polyglot_disabled = ['markdown']
let g:polyglot_disabled = ['autoindent']
let g:lsp_cxx_hl_use_text_props = 1

hi Pmenu ctermfg=250 ctermbg=235 guifg=#bcbcbc guibg=#262626
hi PmenuSel ctermfg=250 ctermbg=131 guifg=#bcbcbc guibg=#af5f5f

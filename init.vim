call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')

" latex syntax
Plug 'lervag/vimtex'
" latex preview
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" gruvbox
Plug 'morhetz/gruvbox'
" vimwiki
Plug 'vimwiki/vimwiki'
" vim hex color
Plug 'ap/vim-css-color'
" youcomplete me
Plug 'ycm-core/YouCompleteMe'
" nerdtree
Plug 'preservim/nerdtree'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

set rnu
set nu

" Status bar
function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
	let l:branchname = GitBranch()
	" se c'è un nome lo metto altrimenti metto vuoto
	return strlen(l:branchname) > 0 ? '  '.l:branchname.' ':''
endfunction

set laststatus=2

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\%y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ [%l:%c]

colorscheme gruvbox
set cc=80
" open termianl in vim \\t
noremap <Leader>\t :sp +te<CR>
" vertical
" noremap <Leader>\t :vs +te<CR>
noremap zz : w<CR>

" do not set number when i open a termianl
augroup neovim_terminal
    autocmd!
    " Enter Terminal-mode (insert) automatically
    autocmd TermOpen * startinsert
    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber norelativenumber
    " allows you to use Ctrl-c on terminal window
    autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
augroup END

" We don't need NERDTREE
" Vexplore
let g:netrw_banner = 0 " suppress ungly banner
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 25


" vimwiki settings
set nocompatible
filetype plugin on
syntax on
let g:automatic_nested_syntaxes = 1
let g:vimwiki_list =
			\ [{'path' : '~/vimwiki'},
			\ {'path' : '~/vimwiki/rust'}]
 " latex-previe
let g:livepreview_previewer = 'zathura'
"navication terminal
" Status bar
function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
	let l:branchname = GitBranch()
	" se c'è un nome lo metto altrimenti metto vuoto
	return strlen(l:branchname) > 0 ? '  '.l:branchname.' ':''
endfunction

set laststatus=2

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\%y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ [%l:%c]

colorscheme gruvbox
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
" not for input mode
"inoremap <A-h> <C-\><C-N><C-w>h
"inoremap <A-j> <C-\><C-N><C-w>j
"inoremap <A-k> <C-\><C-N><C-w>k
"inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" super funky exit
inoremap <A-CR> <Esc>

" trasparency
hi Normal guibg=NONE ctermbg=NONE

" change mapleader
let mapleader = " "

noremap <silent> <leader>k :wincmd k<CR>
noremap <silent> <leader>j :wincmd j<CR>
noremap <silent> <leader>h :wincmd h<CR>
noremap <silent> <leader>l :wincmd l<CR>
noremap <silent> <leader>s :split   <CR>
noremap <silent> <leader>v :vsplit   <CR>
noremap <silent> <leader>q :quit<CR>
nnoremap <leader>pv :Ex<CR>


" Youcomplete shortcut
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>


" Nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" redundat space at the end of the line
syn match RedundantSpaces /\s\+$/
command! RedundantSpace : highlight RedundantSpaces ctermbg=red guibg=red

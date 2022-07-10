call plug#begin('~/.config/nvim/plugged')

" latex syntax
Plug 'lervag/vimtex', { 'for': 'tex' }
" latex preview
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" themes
Plug 'morhetz/gruvbox'
" vimwiki
Plug 'vimwiki/vimwiki'
" vim hex color
Plug 'ap/vim-css-color'

" youcomplete me
Plug 'ycm-core/YouCompleteMe'
" nerdtree
Plug 'preservim/nerdtree'

Plug 'jceb/vim-orgmode'
" telescope
" Plug 'nvim-lua/popup.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

set rnu
set nu

set termguicolors

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
set statusline+=%#CursorLineNr#
set statusline+=%{StatuslineGit()}
set statusline+=%#DiffChange#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\%y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ [%l:%c]

"colorscheme molokai
colorscheme gruvbox
"colorscheme elflord
"colorscheme 256_noir
"colorscheme gotham
set background=dark
"let g:gruvbox_constrat_dark = 'hard'
set cc=80
"hi ColorColumn ctermbg=NONE guibg=Magenta
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
			\ [{'path' : '~/projects/note/'}]
 " latex-previe
let g:livepreview_previewer = 'zathura'

" super funky exit
imap jk <Esc>

" trasparency
"hi Normal guibg=none ctermbg=none
"hi LineNr guibg=none ctermbg=none
"hi Folded guibg=none ctermbg=none
"hi NonText guibg=none ctermbg=none
"hi SpecialKey guibg=none ctermbg=none
"hi SignColumn guibg=none ctermbg=none

" change mapleader
let mapleader = " "

noremap <silent> <leader>k :wincmd k<CR>
noremap <silent> <leader>j :wincmd j<CR>
noremap <silent> <leader>h :wincmd h<CR>
noremap <silent> <leader>l :wincmd l<CR>
noremap <silent> <leader>= :wincmd =<CR>
" rotate
noremap <silent> <leader>J :wincmd J<CR>
" rotate
noremap <silent> <leader>H :wincmd H<CR>
noremap <silent> <leader>s :split   <CR>
noremap <silent> <leader>v :vsplit   <CR>
noremap <silent> <leader>q :quit<CR>
nnoremap <leader>pv :Ex<CR>


"    ____  __            _               __               __             __
"   / __ \/ /_  ______ _(_)___     _____/ /_  ____  _____/ /________  __/ /_
"  / /_/ / / / / / __ `/ / __ \   / ___/ __ \/ __ \/ ___/ __/ ___/ / / / __/
" / ____/ / /_/ / /_/ / / / / /  (__  ) / / / /_/ / /  / /_/ /__/ /_/ / /_
"/_/   /_/\__,_/\__, /_/_/ /_/  /____/_/ /_/\____/_/   \__/\___/\__,_/\__/
"              /____/

" Youcomplete shortcut
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>


" Nerdtree
"nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" GitGutter
" Disable all gitgutter key mapping (I want only info)
let g:gitgutter_map_keys = 0
noremap <leader>gv <cmd>GitGutterPreviewHunk <cr>
noremap <leader>gu <cmd>GitGutterUndoHunk <cr>
noremap <leader>gn <cmd>GitGutterNextHunk <cr>
noremap <leader>gp <cmd>GitGutterPrevHunk <cr>

" redundat space at the end of the line
syn match RedundantSpaces /\s\+$/
command! RedundantSpace : highlight RedundantSpaces ctermbg=red guibg=red

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Highlight trailing spaces
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Relative or absolute number toggle
function! NumberToggle()
    if(&nu == 1 && &rnu == 1)
        set nu!
        set rnu!
    else
        set rnu
        set nu
    endif
endfunction

nnoremap <leader>n :call NumberToggle()<CR>
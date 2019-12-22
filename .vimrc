set nocompatible " be iMproved, required
"set clipboard=unnamedplus
filetype  on" "required
filetype plugin on

if &compatible
	set nocompatible
endif

let mapleader = " "
syntax on
syntax enable
set number
set cursorline
set wrap
set showcmd
set wildmenu
set hlsearch
set incsearch
set ignorecase
set smartcase
set termguicolors
set foldmethod=syntax
noremap <LEADER>n :nohlsearch<CR>
map S :w<CR>
map Q :q<CR>
noremap n nzz
noremap N Nzz
noremap <c-j> 5j
noremap <c-k> 5k

"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {<CR>}<ESC>O
map ql :set splitright<CR> :vsplit<CR>
map qh :set nosplitright<CR> :vsplit<CR>
map qj :set splitbelow<CR> :split<CR>
map qk :set nosplitbelow<CR> :split<CR>

map<LEADER>j <C-w>j
map<LEADER>k <C-w>k
map<LEADER>h <C-w>h 
map<LEADER>l <C-w>l

map<LEADER><up> :res +5<CR>
map<LEADER><down> :res -5<CR>
map<LEADER><left> :vertical resize -5<CR>
map<LEADER><right> :vertical resize +5<CR>

map tn :tabe<CR>
map th :-tabnext<CR>
map tl :tabnext<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

inoremap <C-j> <Esc>o
inoremap <C-l> <Right>
inoremap <C-h> <Left>
inoremap <C-k> <Esc>O
let &t_SI = "\<ESC>]50;CursorShape=1\x7"
let &t_SR = "\<ESC>]50;CursorShape=2\x7"
let &t_EI = "\<ESC>]50;CursorShape=0\x7"

hi NonText ctermbg = NONE
hi Normal guibg = NONE ctermbg =NONE

vnoremap Y "+y
noremap P "+p

let laststatus = 1
let g:SnazzyTransparent = 1
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
"Plug 'iamcco/markdown-preview.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()
" ===Snazzy
"colorscheme koehler
let g:SnazzyTransparent = 1
colorscheme snazzy
let g:SnazzyTransparent = 1
let g:lightline = {
\'colorscheme':'snazzy',
\}
" ===Nerdtree
map tt  :NERDTreeToggle<CR>
" ===Xuyuanp/nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" ===YcmCompleter
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" ===MarkDownPreview
nmap <silent> mp <Plug>MarkdownPreview
nmap <silent> cpm  <Plug>StopMarkdownPreview
map <LEADER>tm :TableModeToggle<CR>
" ===UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-d>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-s>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

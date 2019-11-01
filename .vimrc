set nocompatible " be iMproved, required
filetype off " required
let mapleader = " "
syntax on
set number
set cursorline
set wrap
set showcmd
set wildmenu
set hlsearch
set incsearch
set ignorecase
set smartcase
set foldmethod=syntax
noremap <LEADER>n :nohlsearch<CR>
map S :w<CR>
map Q :q<CR>
noremap n nzz
noremap N Nzz
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O
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

let laststatus = 1
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'iamcco/markdown-preview.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()
let g:SnazzyTransparent = 1
colorscheme koehler
let g:SnazzyTransparent = 1
" Compatible with ranger 1.4.2 through 1.7.*
"
" Add ranger as a file chooser in vim
"
" If you add this code to the .vimrc, ranger can be started using the command
" ":RangerChooser" or the keybinding "<leader>r".  Once you select one or more
" files, press enter and ranger will quit again and vim will open the selected
" files.

function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    if has("gui_running")
        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>r :<C-U>RangerChooser<CR>

" ===Nerdtree
map tt  :NERDTreeToggle<CR>
map op :custom open<CR>
" ===YcmCompleter
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" ===MarkDownPreview
nmap <silent> mp <Plug>MarkdownPreview
nmap <silent> cpm  <Plug>StopMarkdownPreview
map <LEADER>tm :TableModeToggle<CR>
filetype plugin on
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 1
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1

" ===UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-c>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

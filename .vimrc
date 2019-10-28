let  mapleader = " "
syntax on
set number
set relativenumber	
set cursorline
set wrap
set showcmd
set wildmenu
set hlsearch
set incsearch
set ignorecase
set smartcase
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

let &t_SI = "\<ESC>]50;CursorShape=1\x7"
let &t_SR = "\<ESC>]50;CursorShape=2\x7"
let &t_EI = "\<ESC>]50;CursorShape=0\x7"

let laststatus = 2
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'iamcco/markdown-preview.vim'
Plug 'dhruvasagar/vim-table-mode'
call plug#end()
let g:SnazzyTransparent = 1
colorscheme pablo 
let g:SnazzyTransparent = 1
" ===Nerdtree
map tt  :NERDTreeToggle<CR>
map op :custom open<CR>

nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

nmap <silent> pm <Plug>MarkdownPreview
nmap <silent> cpm  <Plug>StopMarkdownPreview
map <LEADER>tm :TableModeToggle<CR>
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

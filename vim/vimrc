" ~/.vimrc

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" https://github.com/tpope/vim-sensible
Plugin 'tpope/vim-sensible'

"File Manager
Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"PDF Viewer
Plugin 'rhysd/open-pdf.vim'

"YouCompleteMe
Plugin 'oblitum/youcompleteme'

"Lightline
Plugin 'itchyny/lightline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

runtime! plugin/sensible.vim

set encoding=utf-8 fileencodings=
syntax on
set background=dark
set number
set cc=80
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set autoindent
set hlsearch

autocmd Filetype make setlocal noexpandtab

set list listchars=tab:»·,trail:·

inoremap <F1> <lt>F1>
inoremap <F2> <lt>F2>
inoremap <F3> <lt>F3>
inoremap <F4> <lt>F4>
inoremap <F5> <lt>F5>

map <F1> :tabn 1<CR>
map <F2> :tabn 2<CR>
map <F3> :tabn 3<CR>
map <F4> :tabn 4<CR>
map <F5> :tabn 5<CR>

map <C-S-tab> :tabprevious<CR>
map <C-tab>   :tabnext<CR>
map <C-t>     :tabnew<CR>:NERDTree<CR>
map <C-w>     :tabclose<CR>

map <C-o> :NERDTreeToggle<CR>

" Start NERDTree and put the cursor back in the other window.
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" GDB
packadd termdebug
let g:termdebug_wide=1
map <C-G>   :termdebug<CR>

" Cursor line
set cursorline

"au BufNewFile,BufRead *.c call ToggleTerminal('J', 8)

function! TermSetup(buf, side, size) abort
    if a:buf == 0
        term
    else
        execute "sp" bufname(a:buf)
    endif
    execute "wincmd" a:side
    execute "resize" a:size
endfunction

function! ToggleTerminal(side, size) abort
    let tpbl=[]
    let closed = 0
    let tpbl = tabpagebuflist()

    " open first hidden terminal
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)<0')
        if getbufvar(buf, '&buftype') ==? 'terminal'
            call TermSetup(buf, a:side, a:size)
            return
        endif
    endfor

    " open new terminal
    call TermSetup(0, a:side, a:size)
endfunction

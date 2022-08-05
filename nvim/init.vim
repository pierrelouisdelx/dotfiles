call plug#begin()
	" Appearance 
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
	Plug 'ryanoasis/vim-devicons'
	Plug 'navarasu/onedark.nvim'

	" Utilities
	Plug 'sheerun/vim-polyglot'
	" Plug 'jiangmiao/auto-pairs'
	Plug 'ap/vim-css-color'
	Plug 'preservim/nerdtree'
	Plug 'kien/ctrlp.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}
    Plug 'github/copilot.vim'

	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'romgrk/barbar.nvim'

	" Completion / linters / formatters
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'pantharshit00/vim-prisma'

	" Git
	Plug 'airblade/vim-gitgutter'
call plug#end()

" Syntax
filetype plugin indent on
syntax on

" Options
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set mouse=a
set number
" set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu

" Tabs size
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent
set autoindent

set foldmethod=marker

" True color
set termguicolors

" Color scheme and themes
let g:onedark_config = {
  \ 'style': 'deep',
  \ 'toggle_style_key': '<leader>ts',
  \ 'ending_tildes': v:true,
  \ 'diagnostics': {
    \ 'darker': v:false,
    \ 'background': v:false,
  \ },
\ }

let t_Co = 256
colorscheme onedark

" Airline
let g:airline_theme='sobrio'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Italics
let &t_ZH = "\e[3m"
let &t_ZR = "\e[23m"

" Copilot
 let g:copilot_node_command = "~/.nvm/versions/node/v17.9.1/bin/node"

" NERD TREE CONFIGURATION
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p 

" Set default nerdtree width
let g:NERDTreeWinSize=25

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Change automatically Vim's dir with NERDTree's
let g:NERDTreeChDirMode = 2 
let g:NERDTreeMapOpenSplit='$'

"vim-nerdtree-tabs settings :
" Open NERDTree with vim
let g:nerdtree_tabs_open_on_console_startup=1

" Open NERDTree in the new tabs
let g:nerdtree_tabs_open_on_new_tab=1
let g:nerdtree_tabs_meaningful_tab_names=1
let g:nerdtree_tabs_toggle=1
let g:nerdtree_tabs_autoclose=1

" Synchronize NERDTree's tabs
let g:nerdtree_tabs_synchronize_view=1

" CTRLP: Ignore based on gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
    \ 'file': '\.so$\|\.dat$|\.DS_Store$'
\ }

" Disable math tex conceal feature
let g:tex_conceal = ''
let g:vim_markdown_math = 1

" Language server stuff
let g:python3_host_prog = '/usr/bin/python'
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Leader
let mapleader = ','

" Normal mode remappings
nnoremap <C-q> :q!<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-t> :sp<CR>:terminal<CR>
nnoremap <F10> :CocCommand tsserver.organizeImports<CR>

"" Tabs
nnoremap <silent>    <F1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <F2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <F3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <F4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <F5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>
nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>

" Show highlight groups
map <F12> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Auto Commands
augroup auto_commands
	autocmd BufWrite *.py call CocAction('format')
	autocmd FileType scss setlocal iskeyword+=@-@
	autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
augroup END

autocmd BufEnter NERD_tree_* | execute 'normal R'

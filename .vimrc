" ██╗   ██╗██╗███╗   ███╗
" ██║   ██║██║████╗ ████║
" ██║   ██║██║██╔████╔██║
" ╚██╗ ██╔╝██║██║╚██╔╝██║
"  ╚████╔╝ ██║██║ ╚═╝ ██║
"   ╚═══╝  ╚═╝╚═╝     ╚═╝
"

filetype on
filetype plugin on
syntax enable
"Plugin dót
call plug#begin('~/.vim/plugged')
 Plug 'SirVer/ultisnips' | 
 Plug 'honza/vim-snippets'
 Plug 'tpope/vim-surround'
 Plug 'w0rp/ale'
 " Plug 'mcchrish/nnn.vim'
 Plug 'vim-airline/vim-airline'
 Plug 'lervag/vimtex'
 Plug 'maralla/completor.vim'
 Plug 'tpope/vim-commentary'
 Plug 'ctrlpvim/ctrlp.vim'
call plug#end()


"Fokking python rusl
set pyxversion=3

" Basic stillingar
inoremap jj <Esc>
nnoremap Q @

set number
set nowrap
set relativenumber
set tabstop=4
set shiftwidth=4
set smartindent
set smartcase
set ignorecase
set incsearch
set hlsearch
set scrolloff=5
set encoding=utf-8

color fromthehell

" Leader shortcuts
:let mapleader = " "
nmap <silent> <leader>w :w<CR>
nmap <silent> <leader>q :q<CR>
nmap <silent> <leader>v :vsp<CR>
nmap <silent> <leader>b :sp<CR>

" Split navigation
nnoremap <silent> <leader>j <C-W><C-J>
nnoremap <silent> <leader>k <C-W><C-K>
nnoremap <silent> <leader>l <C-W><C-L>
nnoremap <silent> <leader>h <C-W><C-H>

" Disable highlighting
nnoremap i :noh<CR>i

"Visual mode hreyfingar
xnoremap <silent> K :call visual#move_up()<CR>
xnoremap <silent> J :call visual#move_down()<CR>

"Tab completion takki á tab
let g:completor_auto_trigger = 1
let g:completor_clang_binary = '/usr/bin/clang-8'
inoremap <expr> <Tab> tabcomp#Tab_Or_Complete()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Auto brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Let Ctrl-L be expand for snippet
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsSnippetDirectories=['~/.vim/plugged/vim-snippets', 'vim-snippets']

" Airline and ALE integration
let g:airline#extensions#ale#enabled = 4
let g:airline_powerline_fonts = 1

"ALE settings
let g:ale_set_highlights = 0
let g:ale_lint_on_save = 1

"LaTeX settings
let g:tex_flavor = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'latexmk'
let g:vimtex_view_general_viewer = 'zathura'

let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
	\   '-pdflatex="xelatex --shell-escape %O %S"',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

"startify settings


 

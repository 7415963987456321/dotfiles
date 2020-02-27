" ██╗   ██╗██╗███╗   ███╗
" ██║   ██║██║████╗ ████║
" ██║   ██║██║██╔████╔██║
" ╚██╗ ██╔╝██║██║╚██╔╝██║
"  ╚████╔╝ ██║██║ ╚═╝ ██║
"   ╚═══╝  ╚═╝╚═╝     ╚═╝

"Plugin dót
call plug#begin('~/.vim/plugged')
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'w0rp/ale'
    Plug 'vim-airline/vim-airline'
    Plug 'maralla/completor.vim'
    Plug 'tpope/vim-commentary'
    Plug 'lervag/vimtex'
    Plug 'junegunn/fzf.vim'
    Plug 'machakann/vim-sandwich'
    Plug 'tpope/vim-vinegar'
call plug#end()

filetype on
filetype plugin indent on
syntax enable

" Fokking python rusl
set pyxversion=3

" Basic stillingar
inoremap jj <ESC>
nnoremap Q @@
nnoremap <CR> /<CR> :noh<CR>
inoremap <C-e> <Esc>A
nnoremap <BS> X

set mouse=a         " Helvítis tmux
set ttymouse=xterm  " Helvítis tmux
set number
set nowrap
" set lazyredraw  "wtf
set completeopt -=preview
set ignorecase
set relativenumber
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set autoindent "Test
set hlsearch
set scrolloff=8
set encoding=utf-8
set wildmenu
set incsearch
set timeoutlen=350
set listchars=trail:␣,extends:→,tab:>\ 
set list

" Colors
color fromthehell
highlight IncSearch guibg=green ctermbg=green term=underline

" netrw stillingar
let g:netrw_banner=0
let g:netrw_preview=0
let g:netrw_liststyle = 2
let g:netrw_altv = 1

" Autoclose pairs
inoremap "<Tab> ""<left>
inoremap '<Tab> ''<left>
inoremap (<Tab> ()<left>
inoremap [<Tab> []<left>
inoremap <<Tab> <><left>
inoremap {<Tab> {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"Bölvað ANSI lyklaborð
inoremap <C-b> <Bar>

"Reload .vimrc
command! Reload execute ":source $MYVIMRC"

" Leader shortcuts
let mapleader = " "
nmap <silent> <leader>w :w<CR>
nmap <silent> <leader>q :q<CR>
nmap <silent> <leader>o :Explore<CR>
nmap <silent> <leader>v :Vexplore<CR>
nmap <silent> <leader>b :Sex<CR>  " HUEHUEHUE
nmap <silent> <Leader>g :ALEGoToDefinition<CR>
nmap <silent> <Leader>G :ALEGoToDefinitionInSplit<CR>
nmap <silent> <Leader>f :ALEFindReferences<CR>


" Split navigation
nnoremap <silent> <leader>j <C-W><C-J>
nnoremap <silent> <leader>k <C-W><C-K>
nnoremap <silent> <leader>l <C-W><C-L>
nnoremap <silent> <leader>h <C-W><C-H>
" Split rearrange
nnoremap <silent> <leader>J <C-W><S-J>
nnoremap <silent> <leader>K <C-W><S-K>
nnoremap <silent> <leader>L <C-W><S-L>
nnoremap <silent> <leader>H <C-W><S-H>

" Tab nav
nnoremap <silent> <leader><Tab> gt
nnoremap <silent> <leader>t :Texplore<CR>

"Visual mode hreyfingar
xnoremap <silent> K :call visual#move_up()<CR>
xnoremap <silent> J :call visual#move_down()<CR>

" Completor stillingar
let g:completor_auto_trigger = 1
let g:completor_clang_binary = '/usr/bin/clang'
let g:completor_racer_binary = '/usr/bin/racer'

"Tab completion takki á tab
inoremap <expr> <Tab> tabcomp#Tab_Or_Complete()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Let Ctrl-L be expand for snippet
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsSnippetDirectories=['~/.vim/plugged/vim-snippets', 'vim-snippets']

" Airline and ALE integration
let g:airline#extensions#ale#enabled = 4
let g:airline_powerline_fonts = 1

"ALE settings
let g:ale_set_highlights = 0
let g:ale_lint_on_save = 1

"LaTeX stillingar
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
let g:vimtex_fold_manual=1
let g:vimtex_latexmk_continuous=1
let g:vimtex_compiler_progname='latexmk'
let g:vimtex_view_general_viewer='zathura'

let g:vimtex_compiler_latexmk = {
            \ 'options' : [
            \ '-pdf',
            \ '-pvc',
            \ '-bibtex',
            \ '-pdflatex="pdflatex --shell-escape %O %S"',
            \ '-shell-escape',
            \ '-verbose',
            \ '-synctex=1',
            \ '-interaction=nonstopmode',
            \ '-file-line-error',
            \ ],
            \}

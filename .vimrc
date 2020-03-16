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
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-commentary'
    Plug 'lervag/vimtex'
    Plug 'junegunn/fzf.vim'
    Plug 'machakann/vim-sandwich'
    Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'tpope/vim-vinegar'
    Plug 'junegunn/vim-peekaboo' " maybe
call plug#end()

filetype plugin indent on
syntax enable
packadd! matchit

" Fokking python rusl
set pyxversion=3

" Basic stillingar
inoremap jj <ESC>
nnoremap Q @@
nnoremap /<CR> :noh<CR>
inoremap <C-E> <ESC>])a

set mouse=a         " Helvítis tmux
set ttymouse=xterm  " Helvítis tmux
set nowrap
set lazyredraw  " wtf
set completeopt -=preview
set ignorecase
set smartcase
set relativenumber
set number
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
" set autoindent " Test
set hlsearch
set incsearch
set scrolloff=8
set encoding=utf-8
set wildmenu
set ttimeout
set ttimeoutlen=0
set timeoutlen=400
set listchars=trail:␣,extends:→,tab:>\ 
set list
set noesckeys
set autochdir
set noshowmode
set laststatus=2

" Colors
color fromthehell
highlight IncSearch guibg=green ctermbg=green term=underline
" Fix later?
highlight Normal ctermfg=15 ctermbg=0 cterm=NONE

" Clipboard crap
nnoremap <silent>zp "+p=`]
xnoremap zy "+y

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

" FZF settings
let g:fzf_buffers_jump = 1

nmap <silent> <leader>fb :Buffers<CR>
nmap <silent> <leader>ff :Files<CR>
nmap <silent> <leader>fl :Lines<CR>
nmap <silent> <leader>fw :Windows<CR>
nmap <silent> <leader>fh :Helptags<CR>

imap <c-x><c-l> <plug>(fzf-complete-buffer-line)
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>-1)

"Split navigation
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

"Scroll resize
nnoremap <C-ScrollWheelUp> 3<C-W>-
nnoremap <C-ScrollWheelDown> 3<C-W>+

 " Deoplete Stillingar
let g:deoplete#enable_at_startup = 1
call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')

"Tab completion takki á tab
inoremap <expr> <Tab> tabcomp#Tab_Or_Complete()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Search and replace the word under the cursor
noremap <leader>ss :%s/\<<C-r><C-w>\>/

" Testing
" Send to ix.io pastebin
vnoremap <Leader>pp :w !curl -F "f:1=<-" ix.io<CR>

" Let Ctrl-L be expand for snippet
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsSnippetDirectories=['~/.vim/plugged/vim-snippets', 'vim-snippets']

" fallback Remove later
" Airline and ALE integration
" let g:airline_theme='luna'
" " let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#ale#enabled = 4
" let g:airline_powerline_fonts = 0

" Lightline
let g:lightline = {
            \ 'colorscheme': 'PaperColor_dark',
            \ }

let g:lightline.tabline = {
            \ 'left': [ [ 'tabs' ] ],
            \ 'right': [ [ '' ] ] }

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

" Deoplete completion fyrir vimtex
call deoplete#custom#var('omni', 'input_patterns', {
            \ 'tex': g:vimtex#re#deoplete
            \})

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

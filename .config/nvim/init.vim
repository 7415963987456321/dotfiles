"  _ ____   _(_)_ __ ___
" | '_ \ \ / / | '_ ` _ \
" | | | \ V /| | | | | | |
" |_| |_|\_/ |_|_| |_| |_|


"Plugin dót
call plug#begin('~/.vim/plugged')
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-commentary'
    Plug 'lervag/vimtex'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf.vim'
    Plug 'machakann/vim-sandwich'
    Plug 'tpope/vim-vinegar'
    Plug 'junegunn/vim-peekaboo' " maybe
    Plug 'mg979/vim-xtabline'    " TESTING
    Plug 'Krasjet/auto.pairs'
call plug#end()

filetype plugin indent on
syntax   enable
runtime  macros/matchit.vim

" Fokking python rusl
set pyxversion=3

" Basic stillingar
inoremap jj <ESC>
nnoremap Q @@
nnoremap // :noh<CR>
inoremap <C-E> <ESC>])a

" Visual
xnoremap n :norm 
xnoremap <C-J> }
xnoremap <C-K> {

set mouse=a        " Helvítis tmux
set nowrap
set lazyredraw      " wtf
set completeopt -=preview
set completeopt +=noselect
set ignorecase
set smartcase
set relativenumber
set number
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set hlsearch
set incsearch
set scrolloff=8
set encoding=utf-8
set wildmenu
set ttimeout
set ttimeoutlen=0
set timeoutlen=400
set list
set listchars=trail:␣,extends:→,tab:>\ 
set backspace=indent,eol,start
set noshowmode
set laststatus=2
set formatoptions+=j
set virtualedit+=block

" Colors (12, 15, 22, 23, 233?)
augroup Colors
    autocmd!
    autocmd ColorScheme fromthehell highlight IncSearch guibg=green ctermbg=green term=underline
                \ | highlight Normal     ctermfg=23    ctermbg=0       cterm=NONE
                \ | highlight Visual     cterm=NONE    ctermbg=23      ctermfg=15
                \ | highlight CursorLine ctermbg=NONE  cterm=underline
                \ | highlight MatchParen ctermfg=1     ctermbg=NONE    cterm=underline,bold
                \ | highlight Cursor     cterm=reverse
colorscheme fromthehell

" Lowercase completion in wildmenu.
augroup Lowercasemenu
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup END

" Clipboard crap
nnoremap <silent>zp "+p=`]
xnoremap zy "+y

" netrw stillingar
let g:netrw_banner    = 0
let g:netrw_preview   = 0
let g:netrw_liststyle = 2
let g:netrw_altv      = 1

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

" FZF settings
let g:fzf_buffers_jump = 1

nmap <silent> <leader>fb :Buffers<CR>
nmap <silent> <leader>ff :Files<CR>
nmap <silent> <leader>f/ :Files /home/keli<CR>
nmap <silent> <leader>fl :Lines<CR>
nmap <silent> <leader>fw :Windows<CR>
nmap <silent> <leader>fh :Helptags<CR>

imap <c-x><c-l> <plug>(fzf-complete-buffer-line)
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

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
nnoremap <silent> <leader>t     :Texplore<CR>

"Scroll resize
nnoremap <C-ScrollWheelUp>   3<C-W>-
nnoremap <C-ScrollWheelDown> 3<C-W>+

"Tab completion takki á tab
inoremap <expr> <Tab>   tabcomp#Tab_Or_Complete()
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Search and replace the word under the cursor
noremap <leader>ss :%s/\<<C-r><C-w>\>/

" Text objects courtesy of -romainl-
" Square brackets text-objects :ir ar
xnoremap ir i[
xnoremap ar a[
onoremap ir :normal vi[<CR>
onoremap ar :normal va[<CR>

" Let Ctrl-L be expand for snippet
let g:UltiSnipsExpandTrigger      = "<C-l>"
let g:UltiSnipsSnippetDirectories = ['~/.vim/plugged/vim-snippets', 'vim-snippets']

" Lightline customize colors later
let g:lightline = {
        \ 'colorscheme': 'Custard',
        \ 'component': {
        \ 'charvaluehex': '0x%B',
        \ 'lineinfo':     '%2l:%-3v[%L]',
        \ },
        \ }

let g:lightline.tabline = {
            \ 'left':  [ [ 'tabs' ] ],
            \ 'right': [ [ ''     ] ]  }

" " ALE settings
" let g:ale_set_highlights = 0
" let g:ale_lint_on_save   = 1

" CoC stillingar
let g:coc_global_extensions = [
            \ 'coc-tsserver',
            \ 'coc-eslint',
            \ 'coc-java',
            \ 'coc-json',
            \ 'coc-clangd',
            \ 'coc-rls',
            \ ]

" \ 'coc-clang', " Fix error?
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> <leader>N <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>n <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> <leader> g <Plug>(coc-definition)
nmap <silent> <leader> f <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

"LaTeX stillingar
let g:tex_flavor                 = 'latex'
let g:vimtex_quickfix_mode       = 0
let g:vimtex_fold_manual         = 1
let g:vimtex_latexmk_continuous  = 1
let g:vimtex_compiler_progname   = 'latexmk'
let g:vimtex_view_general_viewer = 'zathura'

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

" FUNCTIONS:
function! Strip()
    '<,'>! sed 's/ \+/ /g'|sed 's/\s*$//g'
    normal gv=
endfunction
xnoremap <silent> R :<C-u>silent call Strip()<CR>

" Align, Strips trailing whitespace as well
function! Align()
    '<,'>!column -tL |sed 's/  \(\S\)/ \1/g' |sed 's/\s*$//g'
    normal gv=
endfunction
xnoremap <silent> K :<C-u>silent call Align()<CR>

" Break on through to the other side
function! Break()
    s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
    call histdel("/", -1)
endfunction
nnoremap <CR> :<C-u>call Break()<CR>

" TESTING:
" Experimental pairs matching function;
function! Pair(offset)
    let mat = [')', '}', ']', '>', '"']
    let ab  = ['(', '{', '[', '<', '"']
    " let char = matchstr(getline('.'), '\%' . col('.') . 'c.')
    let char = strcharpart(strpart(getline('.'), col('.') - a:offset), 0, 1)
    let x = match(ab, char)
    if x == -1
        return
    endif
    echo mat[x]
    silent! exec "normal a" . mat[x]
endfunction
nnoremap <C-H> :call Pair(1)<CR>
inoremap <expr> <C-H> Pair(2)<CR>

" Send to ix.io pastebin
vnoremap <Leader>pb :w !curl -F "f:1=<-" ix.io<CR>

" xcodetabline settings
let g:xtabline_settings                   = {}
let g:xtabline_settings.theme             = 'seoul'
let g:xtabline_settings.enable_mappings   = 0
let g:xtabline_settings.show_right_corner = 0
let g:xtabline_lazy                       = 1

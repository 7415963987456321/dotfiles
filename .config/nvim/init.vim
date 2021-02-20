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
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-vinegar'
    Plug 'lervag/vimtex'
    Plug 'junegunn/fzf.vim'
    Plug 'machakann/vim-sandwich'
    Plug 'Krasjet/auto.pairs'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'romainl/vim-tinyMRU'
    Plug 'romainl/vim-qf'
    Plug 'romainl/vim-cool'
    Plug 'mcchrish/nnn.vim'
    Plug 'editorconfig/editorconfig-vim'
call plug#end()

filetype plugin indent on
syntax   enable
runtime  macros/matchit.vim

" Fokking python rusl
set pyxversion=3

" Basic stillingar
inoremap jj <ESC>
nnoremap Q @@
" nnoremap // :noh<CR> " Use vim-cool instead
inoremap <C-E> <ESC>%%a

" Visual
xnoremap n :norm<space>
xnoremap <C-J> }
xnoremap <C-K> {
nnoremap gG ggVG

set mouse=a        " Helvítis tmux
set nowrap
set lazyredraw      " wtf
set completeopt=menuone,noinsert,noselect
set ignorecase
set smartcase
set relativenumber
set number
set tabstop=8
set expandtab
set shiftwidth=4
set smartindent
set autoindent
set hlsearch
set incsearch
set scrolloff=8
set encoding=utf-8
set wildmenu
set wildmode=longest:full,full
set ttimeout
set ttimeoutlen=0
set timeoutlen=400
set list
set listchars=trail:␣,extends:→,tab:>\ 
set backspace=indent,eol,start
set noshowmode
set laststatus=2
set formatoptions+=j "(remember to add t for latex and txt files)
set virtualedit+=block
set autochdir
set wildcharm=<C-z>
set autoread
" set grepprg=rg\ --vimgrep
set hidden

" Colors (12, 15, 22, 23, 24? ugh..)
augroup Colors
    autocmd!
    " Colorscheme overrides, put into colorscheme file later
    autocmd ColorScheme custard highlight IncSearch guibg=green ctermbg=green term=underline
                \ | highlight Normal                               ctermfg=12    ctermbg=0       cterm=NONE
                \ | highlight MatchParen                           ctermfg=1     ctermbg=NONE    cterm=underline,bold
                \ | highlight LspDiagnosticsVirtualTextError       ctermbg=235
                \ | highlight LspDiagnosticsVirtualTextWarning     ctermbg=234
                \ | highlight LspDiagnosticsVirtualTextInformation ctermbg=233
                \ | highlight LspDiagnosticsVirtualTextHint        ctermbg=232
colorscheme custard

" Wildmenu stuff
" Lowercase completion in wildmenu.
augroup Lowercasemenu
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup END

" ignores
set wildignore+=*.swp*.class,*.cache
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=*.tar.*

" Format written text differently for latex and txt files (fix this tomorrow
" or never )
" augroup Formattxt
"     autocmd!
"     autocmd FileType *.tex,*.txt setlocal formatoptions+=t
" augroup END

"TinyMRU
nnoremap <F5> :ME <C-z>

"Buffers (testing)
nnoremap <F4> :Buffers <CR>

" Clipboard crap
noremap <silent>zp "+p=`]
xnoremap zy "+y

" netrw stillingar
let g:netrw_banner    = 0
let g:netrw_preview   = 0
let g:netrw_liststyle = 2
let g:netrw_altv      = 1

"Bölvað ANSI lyklaborð
" inoremap <C-b> <Bar>
inoremap <C-b> ^

" Leader shortcuts
let mapleader = " "
nmap     <silent> <leader>w :w<CR>
nmap     <silent> <leader>q :q<CR>
nmap     <silent> <leader>o :Explore<CR>
nmap     <silent> <leader>v :Vexplore<CR>:bp<CR>
nmap     <silent> <leader>b :Sex<CR>:bp<CR>     " HUEHUEHUE
nnoremap <silent> <leader>t :Texplore<CR>

" FZF settings
let g:fzf_buffers_jump = 1
let g:fzf_layout = {'down': '40%'}

nmap <silent> <leader>fb :Buffers<CR>
nmap <silent> <leader>ff :Files<CR>
nmap <silent> <leader>fr :Rg<CR>
nmap <silent> <leader>f/ :Files /home/keli<CR>
nmap <silent> <leader>fl :Lines<CR>
nmap <silent> <leader>fw :Windows<CR>
nmap <silent> <leader>fh :Helptags<CR>

imap <c-x><c-l> <plug>(fzf-complete-buffer-line)

command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--info=inline']}), <bang>0)

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

" Automatically rebalance windows on vim resize (from Nazar)
augroup window_resize
    autocmd!
    autocmd VimResized * :wincmd =
augroup END


"Scroll resize (broken, thanks tmux)
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

" Join lines without cursor jangle
nnoremap J mzJ`z

" YankPaste (patent pending)
nnoremap yp yyp=k

" Repeatable dot
nnoremap . :<C-u>execute "norm! " . repeat(".", v:count1)<CR>

" Buffer stuffer
nnoremap <silent><Right> :bn<CR>
nnoremap <silent><Left>  :bp<CR>

" Let Ctrl-L be expand for snippet
let g:UltiSnipsExpandTrigger      = "<C-l>"
let g:UltiSnipsSnippetDirectories = ['~/.vim/plugged/vim-snippets', 'vim-snippets']

" Send to 0x0.st pastebin and clipboard
" vnoremap <Leader>pb :w !curl -s -F "file=@-" https://0x0.st<CR>
vnoremap <Leader>pb :Paste0x0<CR>
function! PB(line1, line2) abort
    let  @+ = substitute(system(printf('curl -s -F "file=@-" https://0x0.st/'),
               \ join(getline(a:line1, a:line2), "\n")), "\n$", "", "")
    let @@ = @+
endfunction
command! -range=% Paste0x0 call PB(<line1>, <line2>)

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


"LaTeX stillingar
let g:tex_flavor                 = 'latex'
let g:vimtex_quickfix_autojump   = 0
let g:vimtex_quickfix_mode       = 0
let g:vimtex_fold_manual         = 1
" let g:vimtex_latexmk_continuous  = 1
" was latexmk (investigate)
let g:vimtex_compiler_progname   = 'nvr'
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
    " (/^\s+|\s+$/g, '')
    '<,'>! sed 's/ \+/ /g; s/\s*$//g'
    normal gv=
endfunction
xnoremap <silent> R :<C-u>silent call Strip()<CR>

" Split by char (needs rework)
function! SB()
    " let c = getchar()
    " '<,'>! sed 's/[ \t]*=/&\n/g';
    '<,'>! sed 's/ \+/ /g' | sed 's/[ \t]*,/&\n/g'
endfunction
xnoremap <silent> <C-S> :<C-u>silent call SB()<CR>


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
nnoremap <expr> <silent> <CR> &modifiable ? ":<C-u>call Break()<CR>" : "<CR>"

" COMMANDS:

"Git Blame
command! -range GB echo join(systemlist("git -C " . shellescape(expand('%:p:h')) . " blame -L <line1>,<line2> -cnw --date iso8601 " . expand('%:t')), "\n")

"Reload .vimrc
command! Reload execute ":source $MYVIMRC"
nnoremap <leader>r :Reload<CR>

" TESTING:
" Output to pdf (for code and other stuff):
" :hardcopy > %.ps | !ps2pdf %.ps && rm %.ps
command! HC execute ":hardcopy > %.ps | !ps2pdf %.ps && rm %.ps"

" LSP bindings (needs work)
nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>g <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>r <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0        <cmd>lua vim.lsp.buf.document_symbol()<CR>

"LSP settings:
augroup LSP
    autocmd!
    autocmd! BufEnter * lua require'completion'.on_attach()
    autocmd! Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd! Filetype java setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd! Filetype vim  setlocal omnifunc=v:lua.vim.lsp.omnifunc
augroup END

" Completion
let g:completion_enable_auto_popup  = 1
let g:completion_auto_change_source = 1
let g:completion_enable_snippet     = 'UltiSnips'
let g:completion_enable_auto_paren  = 1
let g:completion_confirm_key        = "\<CR>"

lua require("init")

" Lua stuff for LSP and tree-sitter (experimental)
" luafile ~/.config/nvim/lua/init.lua
" lua require("init")
" The fuck is going on with this?

" Reload config on save
augroup reload_config
    autocmd!
    autocmd! BufWritePost $MYVIMRC nested source %
augroup END

" QUICKFIX:
" " For quickfix? (vim-qf) (TESTING)
" nmap <silent> <Down> :cn<CR>
" nmap <silent> <Up>   :cp<CR>

" Select in the quickfix list
nmap <Up>   <Plug>(qf_qf_previous)
nmap <Down> <Plug>(qf_qf_next)

" Jump to qflist
nmap <leader>c <Plug>(qf_qf_switch)

" Toggle quickfixlist
nmap <F1> <Plug>(qf_qf_toggle)

" Mappings
let g:qf_auto_quit          = 0
let g:qf_mapping_ack_style  = 1
let g:qf_auto_open_quickfix = 0

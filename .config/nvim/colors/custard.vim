" Vim color file - custard
" Originally based on szorfein/fromthehell.vim

set background=dark
if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

set t_Co=256
let g:colors_name = "custard"

hi Normal         ctermfg=215  ctermbg=NONE cterm=NONE      guifg=#f0b357 guibg=#2b161c guisp=#2b161c gui=NONE
hi IncSearch      ctermfg=235  ctermbg=1    cterm=NONE      guifg=#192224 guibg=#BD9800 guisp=#BD9800 gui=NONE
hi WildMenu       ctermfg=NONE ctermbg=248  cterm=NONE      guifg=NONE    guibg=#A1A6A8 guisp=#A1A6A8 gui=NONE
hi SignColumn     ctermfg=235  ctermbg=60   cterm=NONE      guifg=#192224 guibg=#536991 guisp=#536991 gui=NONE
hi SpecialComment ctermfg=1    ctermbg=NONE cterm=NONE      guifg=#BD9800 guibg=NONE    guisp=NONE    gui=NONE
hi Typedef        ctermfg=60   ctermbg=NONE cterm=bold      guifg=#536991 guibg=NONE    guisp=NONE    gui=bold
hi Title          ctermfg=1    ctermbg=236  cterm=bold      guifg=#c4133c guibg=#243033 guisp=#243033 gui=bold
hi Folded         ctermfg=235  ctermbg=248  cterm=NONE      guifg=#192224 guibg=#A1A6A8 guisp=#A1A6A8 gui=italic
hi PreCondit      ctermfg=130  ctermbg=NONE cterm=NONE      guifg=#b35a26 guibg=NONE    guisp=NONE    gui=NONE
hi Include        ctermfg=1    ctermbg=NONE cterm=NONE      guifg=#BD9800 guibg=NONE    guisp=NONE    gui=NONE
hi Float          ctermfg=248  ctermbg=NONE cterm=NONE      guifg=#A1A6A8 guibg=NONE    guisp=NONE    gui=NONE
hi StatusLineNC   ctermfg=23   ctermbg=137  cterm=bold      guifg=#1b4047 guibg=#a8664c guisp=#a8664c gui=bold
hi NonText        ctermfg=66   ctermbg=NONE cterm=NONE      guifg=#5E6C70 guibg=NONE    guisp=NONE    gui=italic
hi DiffText       ctermfg=NONE ctermbg=52   cterm=NONE      guifg=NONE    guibg=#492224 guisp=#492224 gui=NONE
hi ErrorMsg       ctermfg=248  ctermbg=88   cterm=NONE      guifg=#A1A6A8 guibg=#912C00 guisp=#912C00 gui=NONE
hi Debug          ctermfg=1    ctermbg=NONE cterm=NONE      guifg=#BD9800 guibg=NONE    guisp=NONE    gui=NONE
hi PMenuSbar      ctermfg=NONE ctermbg=102  cterm=NONE      guifg=NONE    guibg=#848688 guisp=#848688 gui=NONE
hi Identifier     ctermfg=1    ctermbg=NONE cterm=NONE      guifg=#c2481f guibg=NONE    guisp=NONE    gui=NONE
hi SpecialChar    ctermfg=1    ctermbg=NONE cterm=NONE      guifg=#BD9800 guibg=NONE    guisp=NONE    gui=NONE
hi Conditional    ctermfg=1    ctermbg=NONE cterm=bold      guifg=#BD9800 guibg=NONE    guisp=NONE    gui=bold
hi StorageClass   ctermfg=168  ctermbg=NONE cterm=bold      guifg=#e34471 guibg=NONE    guisp=NONE    gui=bold
hi Todo           ctermfg=189  ctermbg=1    cterm=NONE      guifg=#F9F9FF guibg=#BD9800 guisp=#BD9800 gui=NONE
hi Special        ctermfg=144  ctermbg=NONE cterm=NONE      guifg=#c4b98d guibg=NONE    guisp=NONE    gui=NONE
hi LineNr         ctermfg=101  ctermbg=NONE cterm=NONE      guifg=#857c58 guibg=NONE    guisp=NONE    gui=NONE
hi StatusLine     ctermfg=235  ctermbg=137  cterm=bold      guifg=#192224 guibg=#9e8348 guisp=#9e8348 gui=bold
hi Label          ctermfg=1    ctermbg=NONE cterm=bold      guifg=#BD9800 guibg=NONE    guisp=NONE    gui=bold
hi PMenuSel       ctermfg=235  ctermbg=143  cterm=NONE      guifg=#192224 guibg=#ad9d5e guisp=#ad9d5e gui=NONE
hi Search         ctermfg=235  ctermbg=1    cterm=NONE      guifg=#192224 guibg=#BD9800 guisp=#BD9800 gui=NONE
hi Delimiter      ctermfg=1    ctermbg=NONE cterm=NONE      guifg=#BD9800 guibg=NONE    guisp=NONE    gui=NONE
hi Statement      ctermfg=166  ctermbg=NONE cterm=bold      guifg=#d15719 guibg=NONE    guisp=NONE    gui=bold
hi SpellRare      ctermfg=189  ctermbg=235  cterm=underline guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline
hi Comment        ctermfg=243  ctermbg=NONE cterm=NONE      guifg=#747575 guibg=NONE    guisp=NONE    gui=italic
hi Character      ctermfg=248  ctermbg=NONE cterm=NONE      guifg=#A1A6A8 guibg=NONE    guisp=NONE    gui=NONE
hi TabLineSel     ctermfg=235  ctermbg=186  cterm=bold      guifg=#192224 guibg=#c7b87b guisp=#c7b87b gui=bold
hi Number         ctermfg=167  ctermbg=NONE cterm=NONE      guifg=#d96868 guibg=NONE    guisp=NONE    gui=NONE
hi Boolean        ctermfg=248  ctermbg=NONE cterm=NONE      guifg=#A1A6A8 guibg=NONE    guisp=NONE    gui=NONE
hi Operator       ctermfg=166  ctermbg=NONE cterm=bold      guifg=#e6611e guibg=NONE    guisp=NONE    gui=bold
hi CursorLine     ctermfg=NONE ctermbg=236  cterm=NONE      guifg=NONE    guibg=#222E30 guisp=#222E30 gui=NONE
hi TabLineFill    ctermfg=235  ctermbg=242  cterm=bold      guifg=#192224 guibg=#6e5f5c guisp=#6e5f5c gui=bold
hi WarningMsg     ctermfg=248  ctermbg=88   cterm=NONE      guifg=#A1A6A8 guibg=#912C00 guisp=#912C00 gui=NONE
hi VisualNOS      ctermfg=235  ctermbg=189  cterm=underline guifg=#192224 guibg=#F9F9FF guisp=#F9F9FF gui=underline
hi DiffDelete     ctermfg=NONE ctermbg=235  cterm=NONE      guifg=NONE    guibg=#192224 guisp=#192224 gui=NONE
hi ModeMsg        ctermfg=15   ctermbg=235  cterm=bold      guifg=#F9F9F9 guibg=#192224 guisp=#192224 gui=bold
hi CursorColumn   ctermfg=NONE ctermbg=236  cterm=NONE      guifg=NONE    guibg=#222E30 guisp=#222E30 gui=NONE
hi Define         ctermfg=1    ctermbg=NONE cterm=NONE      guifg=#BD9800 guibg=NONE    guisp=NONE    gui=NONE
hi Function       ctermfg=241  ctermbg=NONE cterm=underline      guifg=#664c66 guibg=NONE    guisp=NONE    gui=bold
hi FoldColumn     ctermfg=235  ctermbg=248  cterm=NONE      guifg=#192224 guibg=#A1A6A8 guisp=#A1A6A8 gui=italic
hi PreProc        ctermfg=214  ctermbg=NONE cterm=NONE      guifg=#ffbd2e guibg=NONE    guisp=NONE    gui=NONE
hi Visual         ctermfg=235  ctermbg=189  cterm=NONE      guifg=#192224 guibg=#F9F9FF guisp=#F9F9FF gui=NONE
hi MoreMsg        ctermfg=1    ctermbg=NONE cterm=bold      guifg=#BD9800 guibg=NONE    guisp=NONE    gui=bold
hi SpellCap       ctermfg=189  ctermbg=235  cterm=underline guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline
hi VertSplit      ctermfg=235  ctermbg=65   cterm=bold      guifg=#192224 guibg=#5f875f guisp=#5f875f gui=bold
hi Exception      ctermfg=1    ctermbg=NONE cterm=bold      guifg=#BD9800 guibg=NONE    guisp=NONE    gui=bold
hi Keyword        ctermfg=179  ctermbg=NONE cterm=bold      guifg=#e3cb6b guibg=NONE    guisp=NONE    gui=bold
hi Type           ctermfg=131  ctermbg=NONE cterm=bold      guifg=#a36d62 guibg=NONE    guisp=NONE    gui=bold
hi DiffChange     ctermfg=NONE ctermbg=52   cterm=NONE      guifg=NONE    guibg=#492224 guisp=#492224 gui=NONE
hi Cursor         ctermfg=235  ctermbg=15   cterm=NONE      guifg=#192224 guibg=#F9F9F9 guisp=#F9F9F9 gui=NONE
hi SpellLocal     ctermfg=189  ctermbg=235  cterm=underline guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline
hi Error          ctermfg=248  ctermbg=88   cterm=NONE      guifg=#A1A6A8 guibg=#912C00 guisp=#912C00 gui=NONE
hi PMenu          ctermfg=167  ctermbg=237  cterm=NONE      guifg=#d64d56 guibg=#3d2929 guisp=#3d2929 gui=NONE
hi SpecialKey     ctermfg=66   ctermbg=NONE cterm=NONE      guifg=#5E6C70 guibg=NONE    guisp=NONE    gui=italic
hi Constant       ctermfg=246  ctermbg=NONE cterm=NONE      guifg=#868e91 guibg=NONE    guisp=NONE    gui=NONE
hi Tag            ctermfg=1    ctermbg=NONE cterm=NONE      guifg=#BD9800 guibg=NONE    guisp=NONE    gui=NONE
hi String         ctermfg=65   ctermbg=NONE cterm=NONE      guifg=#79877f guibg=NONE    guisp=NONE    gui=NONE
hi PMenuThumb     ctermfg=NONE ctermbg=248  cterm=NONE      guifg=NONE    guibg=#a4a6a8 guisp=#a4a6a8 gui=NONE
hi MatchParen     ctermfg=1    ctermbg=NONE cterm=bold      guifg=#BD9800 guibg=NONE    guisp=NONE    gui=bold
hi Repeat         ctermfg=1    ctermbg=NONE cterm=bold      guifg=#BD9800 guibg=NONE    guisp=NONE    gui=bold
hi SpellBad       ctermfg=189  ctermbg=235  cterm=underline guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline
hi Directory      ctermfg=60   ctermbg=NONE cterm=bold      guifg=#536991 guibg=NONE    guisp=NONE    gui=bold
hi Structure      ctermfg=60   ctermbg=NONE cterm=bold      guifg=#536991 guibg=NONE    guisp=NONE    gui=bold
hi Macro          ctermfg=1    ctermbg=NONE cterm=NONE      guifg=#BD9800 guibg=NONE    guisp=NONE    gui=NONE
hi Underlined     ctermfg=189  ctermbg=235  cterm=underline guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline
hi DiffAdd        ctermfg=NONE ctermbg=236  cterm=NONE      guifg=NONE    guibg=#193224 guisp=#193224 gui=NONE
hi TabLine        ctermfg=181  ctermbg=242  cterm=bold      guifg=#d6c0b8 guibg=#6e635c guisp=#6e635c gui=bold
hi cursorim       ctermfg=235  ctermbg=60   cterm=NONE      guifg=#192224 guibg=#536991 guisp=#536991 gui=NONE

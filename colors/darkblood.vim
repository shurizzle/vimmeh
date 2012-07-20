" Author: meh.

hi clear

if exists("syntax on")
    syntax reset
endif

let g:colors_name = "darkblood"

" make stuff more readable
set fcs=vert:│,fold:\ 
set fillchars+=stl:\ ,stlnc:\ 
set listchars=tab:·\ ,trail:░,extends:»,precedes:«
set list

if &term =~ "rxvt"
  silent !echo -ne "\033]12;\#404040\007"
  let &t_SI = "\033]12;\#b21818\007"
  let &t_EI = "\033]12;\#404040\007"
  autocmd VimLeave * :silent !echo -ne "\033]12;\#b21818\007"

  set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
endif

" General colors
hi Normal        cterm=none      ctermfg=gray      ctermbg=none
hi Directory     cterm=none      ctermfg=red       ctermbg=none
hi ErrorMsg      cterm=none      ctermfg=darkred   ctermbg=none
hi NonText       cterm=bold      ctermfg=darkgray  ctermbg=none
hi SpecialKey    cterm=none      ctermfg=darkgray  ctermbg=none
hi LineNr        cterm=none      ctermfg=darkgrey  ctermbg=none
hi CursorLineNr  cterm=none      ctermfg=white     ctermbg=none
hi IncSearch     cterm=none      ctermfg=black     ctermbg=darkred
hi Search        cterm=none      ctermfg=black     ctermbg=darkred
hi Visual        cterm=none      ctermfg=white     ctermbg=darkred
hi VisualNOS     cterm=none      ctermfg=white     ctermbg=darkred
hi MoreMsg       cterm=none      ctermfg=darkgreen ctermbg=none
hi ModeMsg       cterm=bold      ctermfg=none      ctermbg=none
hi Question      cterm=none      ctermfg=darkgreen ctermbg=none
hi WarningMsg    cterm=none      ctermfg=darkred   ctermbg=none
hi WildMenu      cterm=none      ctermfg=white     ctermbg=none
hi TabLine       cterm=underline ctermfg=white     ctermbg=none
hi TabLineSel    cterm=underline ctermfg=white     ctermbg=darkred
hi TabLineFill   cterm=underline ctermfg=white     ctermbg=none
hi DiffAdd       cterm=none      ctermfg=white     ctermbg=darkgreen
hi DiffChange    cterm=underline ctermfg=none      ctermbg=none
hi DiffDelete    cterm=none      ctermfg=white     ctermbg=darkred
hi DiffText      cterm=none      ctermfg=white     ctermbg=none
hi SignColumn    cterm=none      ctermfg=darkred   ctermbg=none
hi StatusLine    cterm=underline ctermfg=black     ctermbg=darkred
hi StatusLineNC  cterm=underline ctermfg=white     ctermbg=none
hi VertSplit     cterm=none      ctermfg=darkred   ctermbg=none
hi CursorColumn  cterm=underline ctermfg=none      ctermbg=none
hi CursorLine    cterm=underline ctermfg=none      ctermbg=none
hi Cursor        cterm=none      ctermfg=white     ctermbg=darkred
hi Title         cterm=bold      ctermfg=white     ctermbg=none
hi Pmenu         cterm=none      ctermfg=darkred   ctermbg=none
hi PmenuSel      cterm=none      ctermfg=black     ctermbg=darkred
hi PmenuSbar     cterm=none      ctermfg=white     ctermbg=darkred
hi Folded        cterm=none      ctermfg=darkred   ctermbg=none
hi FoldColumn    cterm=none      ctermfg=darkred   ctermbg=none
hi MatchParen    cterm=reverse   ctermfg=none      ctermbg=none
hi ColorColumn   cterm=none      ctermfg=white     ctermbg=darkred

if &term =~ "linux"
	hi TabLine       cterm=none ctermfg=white ctermbg=none
	hi TabLineSel    cterm=none ctermfg=white ctermbg=darkred
	hi TabLineFill   cterm=none ctermfg=white ctermbg=none
	hi StatusLine    cterm=none ctermfg=black ctermbg=darkred
	hi StatusLineNC  cterm=none ctermfg=white ctermbg=none
endif

if v:version >= 700
	au InsertEnter * hi StatusLine cterm=none ctermfg=white ctermbg=darkred
	au InsertLeave * hi StatusLine cterm=none ctermfg=black ctermbg=darkred
endif

" Taglist
hi TagListFileName cterm=none ctermfg=darkred ctermbg=none

" ctrlp
hi CtrlPMatch cterm=underline ctermfg=white     ctermbg=none
hi CtrlPStats cterm=none ctermfg=black ctermbg=darkred

" syntax
hi Comment     cterm=bold ctermfg=darkgrey   ctermbg=none
hi PreProc     cterm=none ctermfg=darkgreen  ctermbg=none
hi Constant    cterm=none ctermfg=darkred    ctermbg=none
hi Type        cterm=none ctermfg=darkred    ctermbg=none
hi Statement   cterm=bold ctermfg=darkyellow ctermbg=none
hi Identifier  cterm=none ctermfg=darkgreen  ctermbg=none
hi Ignore      cterm=bold ctermfg=darkgray   ctermbg=none
hi Special     cterm=none ctermfg=brown      ctermbg=none
hi Error       cterm=none ctermfg=white      ctermbg=darkred
hi Todo        cterm=none ctermfg=white      ctermbg=darkred
hi Underlined  cterm=none ctermfg=darkred    ctermbg=none
hi Number      cterm=none ctermfg=darkred    ctermbg=none

" syntax links
hi link String          Constant
hi link Character       Constant
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Function        Identifier
hi link Number          Constant
hi link Repeat          Statement
hi link Label           Statement
hi link Keyword         Statement
hi link Exception       Statement
hi link Operator        Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Normal
hi link SpecialComment  Special
hi link Debug           Special
hi link Conditional     Statement

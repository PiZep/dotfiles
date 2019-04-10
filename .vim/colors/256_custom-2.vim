" Vim color file -- with 256 colour support!
"
" Author: Anthony Carapetis <anthony.carapetis@gmail.com>
" Contributors: Lucas Tadeu <lucastadeuteixeira@gmail.com>
"
" Note: Based on github's syntax highlighting theme
"       Used Brian Mock's darkspectrum as a starting point/template
"       Thanks to Ryan Heath for an easy list of some of the colours:
"       http://rpheath.com/posts/356-github-theme-for-syntax-gem

set background=dark

if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let colors_name = "256_custom-2"

" {{{ General colors
hi Normal       ctermfg=252     ctermbg=234   "ctermfg not modified
hi Cursor       ctermfg=239     ctermbg=15
hi Visual       ctermfg=15      ctermbg=246
hi VisualNOS    ctermfg=15      ctermbg=248
hi Search       ctermfg=228     ctermbg=238     cterm=bold
hi Folded       ctermfg=15      ctermbg=8       cterm=bold
hi Title        ctermbg=238
hi StatusLine   ctermfg=188     ctermbg=24      cterm=bold
hi StatusLineNC ctermfg=234     ctermbg=240     cterm=italic
hi VertSplit    ctermfg=234     ctermbg=234     cterm=none
hi LineNr       ctermfg=246     ctermbg=235     "cterm=bold
hi SpecialKey   ctermfg=238     ctermbg=234     cterm=italic
hi WarningMsg   ctermfg=196
hi ErrorMsg     ctermbg=8       ctermfg=255     cterm=undercurl
hi ColorColumn  ctermbg=248
" }}}

" {{{ Vim => 7.0 specific colors
if version >= 700
    hi CursorLine       ctermbg=236
    hi MatchParen       ctermfg=7       ctermbg=242
    hi Pmenu            ctermfg=15      ctermbg=8       cterm=bold
    hi PmenuSel         ctermfg=7       ctermbg=248     cterm=italic
    hi PmenuSbar        ctermfg=234     ctermbg=248
    hi PmenuThumb       ctermfg=232     ctermbg=240
endif
" }}}

" {{{ Diff highlighting
hi DiffAdd      ctermfg=114     ctermbg=194     cterm=none
hi DiffChange   ctermbg=160     cterm=none
hi DiffText     ctermfg=88      ctermbg=196     cterm=none
hi DiffDelete   ctermfg=248     ctermbg=88      cterm=none
" }}}

" {{{ Syntax highlighting
hi Ignore       ctermfg=8
hi Identifier   ctermfg=75      cterm=none
hi PreProc      ctermfg=102     cterm=bold
hi Comment      ctermfg=242
hi Constant     ctermfg=252     cterm=none
hi String       ctermfg=113
hi Function     ctermfg=67      cterm=bold
hi Statement    ctermfg=186     cterm=bold
hi Type         ctermfg=145     cterm=bold
hi Number       ctermfg=143
hi Todo         ctermfg=15      ctermbg=88      cterm=bold
hi Special      ctermfg=161     cterm=bold
hi Todo         ctermbg=15      ctermfg=196     cterm=underline
hi Label        ctermfg=255     cterm=bold
hi StorageClass ctermfg=246     cterm=bold
hi Structure    ctermfg=246     cterm=bold
hi TypeDef      ctermfg=246     cterm=bold

" {{{ Links
hi! link FoldColumn Folded
hi! link CursorColumn   CursorLine
hi! link NonText    LineNr
" }}}

" {{{ Aliases
hi link cppSTL          Function
hi link cppSTLType      Type
hi link Character       Number
hi link htmlTag         htmlEndTag
hi link htmlLink        Underlined
hi link pythonFunction  Identifier
hi link Question        Type
hi link CursorIM        Cursor
hi link VisualNOS       Visual
hi link xmlTag          Identifier
hi link xmlTagName      Identifier
hi link shDeref         Identifier
hi link shVariable      Function
hi link rubySharpBang   Special
hi link perlSharpBang   Special
hi link schemeFunc      Statement
" }}}

" {{{ Tabs
hi TabLine ctermfg=238 ctermbg=188 guifg=#404040 guibg=#dddddd gui=none
hi TabLineFill ctermfg=238 ctermbg=188 guifg=#404040 guibg=#dddddd gui=none
hi TabLineSel   ctermfg=238 guifg=#404040 gui=bold
" }}}

" {{{ Spelling
if has("spell")
    hi spellBad     guisp=#fcaf3e
    hi spellCap     guisp=#73d216
    hi spellRare    guisp=#fcaf3e
    hi spellLocal   guisp=#729fcf
endif
" }}}


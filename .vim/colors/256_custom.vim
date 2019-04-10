" 256 noir. Basically: dark background, numerals & errors red,
" rest different shades of gray.
" colors 232--248 are shades of gray, from dark to light;
" 16=black, 255=white, 196=red, 88=darkred.
set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "256_custom"

hi Normal          ctermbg=234    ctermfg=255
hi Boolean         ctermbg=234    ctermfg=248
hi Character       ctermbg=234    ctermfg=121
hi Comment         ctermbg=234    ctermfg=242
hi Conditional     ctermbg=234    ctermfg=167      cterm=bold
hi Constant        ctermbg=234    ctermfg=252
hi Cursor          ctermbg=255    ctermfg=16
hi ColorColumn     ctermbg=248    ctermfg=16
hi CursorColumn    ctermbg=236    ctermfg=248
hi CursorLine      ctermbg=236    ctermfg=248
hi Debug           ctermbg=234    ctermfg=248
hi Define          ctermbg=234    ctermfg=255
hi Delimiter       ctermbg=234    ctermfg=88       cterm=bold
hi Directory       ctermbg=234    ctermfg=255
hi Error           ctermbg=88     ctermfg=255
hi Exception       ctermbg=234    ctermfg=124
hi Float           ctermbg=234    ctermfg=167
hi FoldColumn      ctermbg=234    ctermfg=248
hi Folded          ctermbg=234    ctermfg=88
hi Function        ctermbg=234    ctermfg=67       cterm=bold
hi Identifier      ctermbg=234    ctermfg=67       cterm=none
hi Include         ctermbg=234    ctermfg=240      cterm=bold
hi Keyword         ctermbg=234    ctermfg=67       cterm=bold
hi Label           ctermbg=234    ctermfg=255      cterm=bold
hi LineNr          ctermbg=235    ctermfg=245
hi MatchParen      ctermbg=242    ctermfg=16
hi Macro           ctermbg=234    ctermfg=248      cterm=bold
hi ModeMsg         ctermbg=234    ctermfg=248
hi MoreMsg         ctermbg=234    ctermfg=248
hi NonText         ctermbg=234    ctermfg=240
hi Number          ctermbg=234    ctermfg=143
hi Operator        ctermbg=234    ctermfg=167      cterm=bold
hi Pmenu           ctermbg=240    ctermfg=255
hi PmenuSel        ctermbg=248    ctermfg=16
hi PmenuSbar       ctermbg=248    ctermfg=16
hi PmenuThumb      ctermbg=240    ctermfg=232
hi PreCondit       ctermbg=234    ctermfg=255
hi PreProc         ctermbg=234    ctermfg=67       cterm=bold
hi Question        ctermbg=234    ctermfg=248
hi Repeat          ctermbg=234    ctermfg=167      cterm=bold
hi Search          ctermbg=234    ctermfg=160
hi SpecialChar     ctermbg=234    ctermfg=88       cterm=bold
hi SpecialComment  ctermbg=234    ctermfg=245
hi Special         ctermbg=234    ctermfg=146      cterm=bold
hi SpecialKey      ctermbg=233    ctermfg=240
hi Statement       ctermbg=234    ctermfg=167      cterm=bold
hi StatusLine      ctermbg=188    ctermfg=24       cterm=bold
hi StatusLineNC    ctermbg=245    ctermfg=236
hi StorageClass    ctermbg=234    ctermfg=255      cterm=bold
hi String          ctermbg=234    ctermfg=113
hi Structure       ctermbg=234    ctermfg=255      cterm=bold
hi Tag             ctermbg=234    ctermfg=196
hi Title           ctermbg=234    ctermfg=248
hi Todo            ctermbg=234    ctermfg=255      cterm=bold
hi Typedef         ctermbg=234    ctermfg=255
hi Type            ctermbg=234    ctermfg=145      cterm=bold
hi VertSplit       ctermbg=234    ctermfg=240
hi WarningMsg      ctermbg=234    ctermfg=196
hi WildMenu        ctermbg=188    ctermfg=240
hi Visual          ctermbg=248    ctermfg=16
hi VisualNOS       ctermbg=248    ctermfg=16
hi IncSearch       ctermbg=245    ctermfg=255
hi Search          ctermbg=236    ctermfg=208
hi ErrorMsg        ctermbg=124    ctermfg=255
hi SpellBad        ctermbg=88     ctermfg=248
hi SpellCap        ctermbg=124    ctermfg=255
hi SpellLocal      ctermbg=124    ctermfg=255
hi SpellRare       ctermbg=234    ctermfg=124

hi DiffAdd         ctermbg=234    ctermfg=114
hi DiffChange      ctermbg=255    ctermfg=160
hi DiffDelete      ctermbg=234    ctermfg=88
hi DiffText        ctermbg=196    ctermfg=248
hi def link diffCommon          Statement
hi def link diffRemoved         DiffDelete
hi def link diffChanged         DiffChange
hi def link diffAdded           DiffAdd


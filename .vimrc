"Vundle config
set nocompatible              " be iMproved, required
packadd! matchit

"Personal Settings.
"Set Pathogen
"execute pathogen#infect()

" Trying vim-plug
call plug#begin('~/.vim/bundle')

" Plugins not as usefull, but who knows
" Plug 'command-t' | Plug 'L9'
 
Plug 'junegunn/vim-easy-align'
Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/Smart-Tabs'
Plug 'tranvansang/vim-close-pair'

Plug 'sudar/vim-arduino-syntax'
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'vim-scripts/dbext.vim'
Plug 'justinmk/vim-syntax-extra'
Plug 'othree/xml.vim'
Plug 'rstacruz/sparkup'

" Waiting to install ccls for language server
Plug 'natebosch/vim-lsc'
"

call plug#end()

filetype plugin indent on
syntax on
set omnifunc=syntaxcomplete#Complete
set wildmenu
set ignorecase

" Language Server Protocol: vim-lsc configuration
if executable('ccls')
    let c_lsp = 'ccls'
else
    let c_lsp = 'clangd'
endif
let g:lsc_server_commands = {
		\ 'c':      c_lsp,
		\ 'python': 'pyls',
                \ 'go':     'gopls',
                \ }
let g:lsc_auto_map = {
            \ 'GoToDefinition': 'gd',
            \ 'FindReferences': 'gr',
            \ 'Rename':         'gR',
            \ 'ShowHover':      'K',
            \ 'Completion':     'omnifunc',
            \}

let g:lsc_enable_autocomplete  = v:true
let g:lsc_enable_diagnostics   = v:true
let g:lsc_reference_highlights = v:true
let g:lsc_trace_leve           = 'message'

autocmd CompleteDone * silent! pclose
autocmd InsertEnter,BufEnter * let status = LSCServerStatus()

"Disable the bell {{{
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
"}}}

"Set Color Scheme and Font Options {{{
"set guifont=Anonymice_Powerline:h10:cANSI:qDRAFT

if &term=~'linux' || &term!~'256'
    colorscheme elflord
else
    let g:dark_colo = '256_custom-2'
    let g:light_colo = 'github'

    function! SwitchColor()
	if (&background == "dark")
	    set background=light
	    execute "colorscheme ".g:light_colo
	else
	    set background=dark
	    execute "colorscheme ".g:dark_colo
	endif
    endfunction

    set background=dark
    execute "colorscheme ".g:dark_colo

    augroup anyfile
	autocmd!
	autocmd vimenter * nnoremap <localleader>b : call SwitchColor()<CR>
    augroup end>
endif
" }}}

set encoding=utf-8

"Set Syntastic"{{{
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0"}}}

"Set status line always
set laststatus=2

"Set other options

set list
set listchars=tab:\|\ ,eol:¬,
set scrolloff=5
set number
set showcmd
set history=1000
set undolevels=1000
set noerrorbells
set nocursorcolumn nocursorline
set textwidth=79
set formatoptions+=t

let python_highlight_all = 1

let maplocalleader="ù"
let g:layout = system('xkblayout-state print "%e"')
if layout == 'azerty'
    let maplocalleader="ù"
elseif layout == 'bepo'
    let maplocalleader="ç"
endif

" Default indentation
set copyindent
set expandtab
set softtabstop=4
set shiftwidth=4

" Custom functions{{{
function! CheckPatternUnderCursor(pattern)
    let length = strlen(a:pattern)
    let str_under = strcharpart(getline('.'), col('.') - 2, l:length)
    echom l:str_under a:pattern l:length
    if l:str_under ==# a:pattern
	echom "CheckPatternUnderCursor success"
	return 1
    else
	echom "CheckPatternUnderCursor failure"
	return 0
    endif
endfunction

function! FindPairWiseMatching()
    return 0
endfunction

function! s:AutoColon()
    let line = getline('.')
    if line =~# '^\s*\(def\|class\) \w\+(\(\w\|\s\|,\|=\)*)\(:\_$\)\@!'
	echom "AutoColon triggered"
	return ":\<CR>"
    else
	return "\<CR>"
endfunction

function! GetCharUnderCursor()
    return matchstr(getline('.'), '\%'.col('.').'c.')
endfunction

" }}}

"Emmet settings{{{
let g:user_emmet_leader_key="<C-e>"
"}}}

"EasyAling settings{{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"}}}

" Mappings {{{
inoremap jk <Esc>
vnoremap jk <Esc>
inoremap vd <Esc>
vnoremap vd <Esc>
nnoremap <silent> j gj
nnoremap <silent> k gk

nnoremap <silent> <localleader>e :vsplit $MYVIMRC<CR>
nnoremap <silent> <localleader>s :source $MYVIMRC<CR>
nnoremap <silent> <localleader>j ddp
nnoremap <silent> <localleader>k ddkP
nnoremap <silent> <localleader>h :set hlsearch!<CR>
nnoremap <silent> <localleader>c :set cursorline! cursorcolumn!<CR>
nnoremap <silent> <localleader>u :echo synIDattr(synID(line("."), 
            \col("."), 1), "name")<CR>
inoremap {<CR> {<CR>}<C-c>O
inoremap (; ();<ESC>ba
inoremap [; [];<ESC>ba

" }}}

" Vimscripts files settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType,BufEnter vim setlocal
		\ foldmethod=marker
augroup end
"}}}
"
" Java files settings {{{
augroup filetype_java
    autocmd!
    autocmd FileType,BufEnter java setlocal
		\ expandtab
		\ shiftwidth=4
		\ softtabstop=4
		\ tabstop=8
augroup end
"}}}

" xml files settings {{{
augroup filetype_xml
    autocmd!
    autocmd FileType,BufEnter xml,xsd,html,css setlocal
		\ expandtab
		\ shiftwidth=2
		\ softtabstop=2
		\ tabstop=8
		\ foldmethod=indent
    autocmd FileType xml,xsd iabbrev <buffer> <?y <?xml version="1.0" encoding="utf-8" standalone="yes"?>
    autocmd FileType xml,xsd iabbrev <buffer> <?n <?xml version="1.0" encoding="utf-8" standalone="no"?>
    autocmd FileType xml,xsd iabbrev <buffer> <? <?xml version="1.0" encoding="utf-8"?>
    autocmd BufEnter *.*xml*,*.xsd
		\ colorscheme mustang
    autocmd BufEnter *.*xml*,*.xsd echo "enter xml"
    autocmd BufLeave *.*xml*,*.xsd
		\ execute "colorscheme ".g:dark_colo
    autocmd BufLeave *.*xml*,*.xsd echo "quit xml"
augroup end
"}}}

" octave/matlab files settings {{{
augroup filetype_octave
    autocmd!
    autocmd BufRead,BufNewFile *.m,*.oct setlocal
		\ filetype=octave
		\ expandtab
		\ shiftwidth=2
		\ softtabstop=2
		\ tabstop=8
    autocmd FileType matlab setlocal keywordprg=info\ octave\ --vi-keys\ --index-search
augroup end"}}}

" c files settings {{{
augroup filetype_c
    autocmd!
    autocmd BufRead,BufNewFile *.c,*.o,*.h setlocal
		\ tags+=~./.vim/systags
		\ cindent
		\ cinoptions=(0,u0,U0
augroup end
"}}}
"(:"
" python files settings {{{
augroup filetype_python
    autocmd!
    autocmd BufRead,BufEnter,BufNewFile *.py,*.pyc setlocal
		\ foldmethod=indent
		\ tabstop=8
		\ expandtab
		\ softtabstop=4
		\ autoindent
    autocmd BufRead,BufEnter,BufNewFile *.py,*.pyc
		\ inoremap <buffer> <expr> : CheckPatternUnderCursor('(') ?  "):<ESC>o":':'
    autocmd BufRead,BufEnter,BufNewFile *.py,*.pyc
		\ inoremap <buffer> <expr> <CR> <SID>AutoColon()
augroup end
"}}}

"diffopt-------{{{

set diffexpr=MyDiff()
function! MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
	if &sh =~ '\<cmd'
	    let cmd = '""' . $VIMRUNTIME . '\diff"'
	    let eq = '"'
	else
	    let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
	endif
    else
	let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
"}}}

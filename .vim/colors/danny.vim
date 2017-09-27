" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
" https://github.com/tomasr/molokai
"
" Note: Based on the Monokai theme for TextMate
" by Wimer Hazenberg and its darker variant
" by Hamish Stuart Macpherson
"

hi clear

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="danny"

"
" Support for 256-color terminal
"
if &t_Co > 255
   " LUA SHIT
   hi luaLocal          ctermfg=46
   hi luaFunction       ctermfg=46
   hi luaCond           ctermfg=226
   hi luaElse           ctermfg=226
   hi luaString         ctermfg=129
   hi luaComment        ctermfg=8
   hi luaFuncCall       ctermfg=39
   " function definition
   hi luaFuncId         ctermfg=27
   hi luaFuncParens     ctermfg=201
   hi luaFuncArgName    ctermfg=202
   hi luaOperator       ctermfg=196
   hi luaSpecialTable	ctermfg=39
   hi luaBuiltIn      ctermfg=37

   hi String         ctermfg=129
   hi Type		ctermfg=39
   hi Typedef		ctermfg=39
   hi Statement         ctermfg=196
   hi Constant          ctermfg=21
   hi Number            ctermfg=202
   hi Normal                            ctermbg=235
   hi CursorLine        ctermfg=none    ctermbg=236     cterm=none
   hi CursorLineNr      ctermfg=51
   hi LineNr            ctermfg=33

   hi Pmenu             ctermfg=33    ctermbg=238   
   hi PmenuSel          ctermfg=201   ctermbg=240

end


" Must be at the end, because of ctermbg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark

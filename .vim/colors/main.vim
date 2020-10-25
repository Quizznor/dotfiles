" First remove all existing highlighting.
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "main"

hi Normal guibg=#aaaaaa guifg=#aaaaaa

" Syntax Highlighting for LaTeX
hi texComment       ctermfg=21              " Comments in file
hi Delimiter        ctermfg=22              " Delimiter foreground color
hi texTodo          ctermfg=23 ctermbg=21   " inverse colors for TODO note
hi texSection       ctermfg=24 cterm=bold   " \chapter, \section, \subsection color
hi texRefZone       ctermfg=24              " Color of ref arguments and \cite
hi texStatement     ctermfg=25 cterm=bold   " \command highlighting
hi texBeginEnd      ctermfg=26 cterm=bold   " \begin command highlight
hi texLength        ctermfg=26              " Color of size arguments
hi texInputFileOpt  ctermfg=26              " Same as above, but in edge cases
hi texInputFile     ctermfg=27 cterm=bold   " string path to input files
hi texTypeStyle     ctermfg=25 cterm=bold   " TypeStyle command highlights
hi texCite          ctermfg=22 cterm=bold   " Foreground for citation arguments
hi texMathZoneX     ctermfg=24              " Math mode syntax for equations
hi texMathMatcher   ctermfg=24              " Math environment highlighting
hi texMathZoneY     ctermfg=24              " More mathmode and some edge cases
hi texMathZoneC     ctermfg=24              " Apparently theres a math mode c as well
hi texMathZoneCS    ctermfg=24              " When do all the different math modes stop?
hi texOnlyMath      ctermfg=24              " And even more math mode
hi texSpecialChar   ctermfg=22 cterm=bold   " Add custom appearance for special chars

" Special definitions for short(?) tex files
hi initexComment            ctermfg=21              " Root file specifier
hi plaintexMath             ctermfg=24              " foreground color for alternate math mode
hi plaintexMathLetter       ctermfg=24              " more math mode definitions
hi plaintexControlSequence  ctermfg=25 cterm=bold   " color of commands, i guess
hi plaintexMathCommand      ctermfg=22 cterm=bold   " Special chars in alternate mode

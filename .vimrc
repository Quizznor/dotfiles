" First of all some general settings

  " set the line numbering
  set number relativenumber

  " support utf-8 encoding
  set fileencoding=utf-8
  set encoding=utf-8

  " enable syntax highlighting
  syntax on

"""""""""""""""""""""""""""""
" more helpful settings here

" vim-latex to build and view the tex file (mm for full build with biber, nn for quick build)
map mm :! /home/quizznor/.config/scripts/vim-latex.sh %:p:h %:t full<CR><CR>
map nn :! /home/quizznor/.config/scripts/vim-latex.sh %:p:h %:t<CR>

" get rid of build files as soon as the tex file is closed
autocmd VimLeave *.tex !rm -rf *.aux *.log *.bbl *.blg
autocmd VimLeave *.tex !killall zathura

" todo: latex snippets, autojump command

" First of all some general settings

  " set the line numbering
  set number relativenumber

  " match indention to previous line
  set autoindent

  " support utf-8 encoding
  set fileencoding=utf-8
  set encoding=utf-8

  " enable syntax highlighting
  set background=light
  colorscheme main
  syntax on

"""""""""""""""""""""""""""""
" more helpful settings here

" vim-latex to build and view the tex file (mm for full build with biber, nn for quick build)
map mm :! /home/quizznor/.config/scripts/vim-latex.sh %:p full<CR><CR>
map nn :! /home/quizznor/.config/scripts/vim-latex.sh %:p<CR><CR>

" get rid of build files as soon as the tex file is closed
autocmd VimLeave *.tex !killall zathura

" automatically change fontsize when writing stuff
autocmd VimEnter *.tex :silent !xdotool key ctrl+i && exit
autocmd VimLeave *.tex !xdotool key ctrl+o

" autojump to next occurence of (...)
map <Space><Space> : /(...)<CR>n

" todo: latex snippets, autojump command













" shows syntaxic group of the word under the cursor
command! SynStack call SynStack()<CR>
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

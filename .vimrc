" First of all some general settings

  " set the line numbering
  set number relativenumber

  " match indention to previous line
  " set autoindent

  " support utf-8 encoding
  set fileencoding=utf-8
  set encoding=utf-8

  " enable syntax highlighting
  set background=light
  colorscheme main
  syntax on

"""""""""""""""""""""""""""""
" more helpful settings here

" see vim-latex for details (mm for full build, nn for quick build)
map mm :! /home/quizznor/.config/scripts/vim-latex.sh %:p build full<CR><CR>
map nn :! /home/quizznor/.config/scripts/vim-latex.sh %:p build <CR><CR>

" automatically change fontsize when writing stuff
autocmd VimEnter *.tex :silent !xdotool key ctrl+9
autocmd VimLeave *.tex :silent !xdotool key ctrl+0

" open/close working pdf file when entering/leaving a .tex file
autocmd VimLeave *.tex !killall zathura && rm -rf ./nohup.out
autocmd VimEnter *.tex :silent ! /home/quizznor/.config/scripts/vim-latex.sh %:p open

" autojump to next occurence of --
map <Space><Space> : /--<CR>ggnxxi

" VimPlug section
call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips'
Plug 'Townk/vim-autoclose'

call plug#end()

" Ultisnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" shows syntaxic group of the word under the cursor
command! SynStack call SynStack()<CR>
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

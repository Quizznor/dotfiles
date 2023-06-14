" First of all some general settings

  " set the line numbering
  set number relativenumber

  " match indention to previous line
  set autoindent

  " support utf-8 encoding
  set fileencoding=utf-8
  set encoding=utf-8

  " enable syntax highlighting
  syntax on

"""""""""""""""""""""""""""""
" more helpful settings here

" unindent with Shift+Tab
inoremap <S-Tab> <C-d>
nnoremap <S-Tab> <<

" open/close working pdf file when entering/leaving a .tex file
autocmd VimLeave *.tex :silent ! ~/.config/scripts/latex_build.sh %:p clean
autocmd VimEnter *.tex :silent ! ~/.config/scripts/latex_build.sh %:p open

" see vim-latex for details (mm for full build, nn for quick build)
map mm :! /home/quizznor/.config/scripts/latex_build.sh %:p build full<CR><CR>
map nn :! /home/quizznor/.config/scripts/latex_build.sh %:p build <CR><CR>







" VimPlug section

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips'                     " LaTex Snippets
Plug 'Townk/vim-autoclose'                  " Bracket autocompletion

call plug#end()

let g:UltiSnipsSnippetsDir = "~/.config/.vim/UltiSnips"
let g:UltiSnipsSnippetDirectories = "~/.config/.vim/UltiSnips"
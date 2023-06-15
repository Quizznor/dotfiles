" First of all some general settings

  " set the line numbering
  set number relativenumber

  " match indention to previous line
  set autoindent

  " support utf-8 encoding
  set fileencoding=utf-8
  set encoding=utf-8

  " syntax highlighting
  colorscheme monokai_pro
  set termguicolors
  syntax on

"""""""""""""""""""""""""""""
" more helpful settings here

" unindent with Shift+Tab
inoremap <S-Tab> <C-d>
nnoremap <S-Tab> <<

" open/close working pdf file when entering/leaving a .tex file
autocmd VimLeave *.tex :silent ! ~/.config/scripts/latex_build.sh %:p clean && rm -rf nohup.out
autocmd VimEnter *.tex :silent ! ~/.config/scripts/latex_build.sh %:p open

" see latex_build for details (mm for full build, nn for quick build)
map mm :! /home/quizznor/.config/scripts/latex_build.sh %:p build full<CR><CR>
map nn :! /home/quizznor/.config/scripts/latex_build.sh %:p build <CR><CR>

" custom highlighting for special LaTeX groups
" Special syntax groups in .config/after/syntax/tex.vim
" :so $VIMRUNTIME/syntax/hitest.vim  -->  list all syntax groups

highlight texDocType guifg=#ffd866
highlight texSection guifg=#ffd866 cterm=bold
highlight texRefZone guifg=#4d5e8b cterm=bold


" VimPlug section
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips'                     " LaTex Snippets
Plug 'Townk/vim-autoclose'                  " Bracket Autocompletion
Plug 'phanviet/vim-monokai-pro'             " Monokai Pro Colorscheme 

call plug#end()

let g:UltiSnipsSnippetsDir = "~/.config/.vim/UltiSnips"
let g:UltiSnipsSnippetDirectories = "~/.config/.vim/UltiSnips"

" shows syntaxic group of the word under the cursor
command! Syntax call SynStack()
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
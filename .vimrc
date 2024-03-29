" First of all some general settings

  " set the line numbering
  set number relativenumber

  " support utf-8 encoding
  set fileencoding=utf-8
  set encoding=utf-8

  " syntax highlighting
  colorscheme monokai_pro
  set termguicolors
  syntax on

  " idk, this fixes a random visual glitch
  set lines=50 columns=100

""""""""""""""""""""""""""""""
" more helpful settings here

" unindent with Shift+Tab
inoremap <S-Tab> <C-d>
nnoremap <S-Tab> <<

" open/close working pdf file when entering/leaving a .tex file
autocmd VimLeave *.tex :silent ! ~/.config/scripts/latex_build.sh %:p clean
autocmd VimEnter *.tex :silent ! ~/.config/scripts/latex_build.sh %:p open

map nn :! (cd ../ && make) <CR><CR>
map mm :! (cd ../ && make clean) <CR>

" custom highlighting for special LaTeX groups
" Special syntax groups in .config/after/syntax/tex.vim
" :so $VIMRUNTIME/syntax/hitest.vim  -->  list all syntax groups
let g:tex_flavor = "latex"

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
Plug 'easymotion/vim-easymotion'            " EasyMotion navigation
Plug 'powerline/powerline'                  " More powerful status line
Plug 'vim-airline/vim-airline'              " Fancy statusline + color
Plug 'vim-airline/vim-airline-themes'       " Themes for vim-airline

call plug#end()

" UltiSnips
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsSnippetsDir = "~/.config/.vim/UltiSnips"
let g:UltiSnipsSnippetDirectories = "~/.config/.vim/UltiSnips"

" Airline
let g:airline_theme='raven'
let g:airline_left_sep='>'
let g:airline_right_sep=''
let g:airline_alt_sep=''
let g:airline_powerline_fonts = 1
let g:airline_section_z = ''
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_c = '%f'

" Vimscript helper functions for UltiSnips
" Cannot be loaded from global definition?
function! Syntax()
    return 
endfunction

function! GetSectionHeader()

  " change .vim/plugged/ultisnips/pythonx/UltiSnips/text_objects for this to work
  let SyntaxGroups = map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  let IsSubsubsection = index(SyntaxGroups, "texSubsubsection") + 1
  let IsSubsection = index(SyntaxGroups, "texSubsection") + 1
  let IsSection = index(SyntaxGroups, "texSection") + 1

  if IsSubsubsection
    let choice = ["\\bro...","stop"]
  elseif IsSubsection
    let choice = ["\\subsubsection*","sssec"]
  elseif IsSection
    let choice = ["\\subsection","ssec"]
  else
    let choice = ["\\section","sec"]
  endif

  echo choice
  return choice

endfunction
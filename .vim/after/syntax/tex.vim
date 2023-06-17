" Temporary edits to tex file
syntax match texTodo /\\todo{.*}/ containedin=TOP
syntax match snipComplete /<<.*>>/hs=s-2 containedin=TOP

highlight snipComplete guibg=#ffd866 guifg=#2b282c
highlight texTodo guibg=#a9dc76 guifg=#e52ae8 cterm=bold

" Enable recognition of chapter/section/etc. beginning AND ending
" This might cause issues if matching too greedily, please verify this works 
" (i.e match beginning of first chapter and end of second chapter (1 large match))
" syntax region texChapter start=/\\chapter/ end=/%\/ chap .*/ containedin=TOP
" syntax region texSection start=/\\section/ end=/%\/ - sec .*/ containedin=TOP
" syntax region texSubsection start=/\\subsection/ end=/%\/ -- ssec .*/ containedin=texSection
" syntax region texSubsubsection start=/\\subsubsection/ end=/%\/ --- sssec .*/ containedin=texSubsection



" Visual sugar
highlight texDocType guifg=#ffd866
highlight texTypeStyle guifg=#a9dc76
highlight texRefZone guifg=#4d5e8b cterm=bold

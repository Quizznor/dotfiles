syntax match texTodo /\\todo{.*}/ containedin=texDocZone
syntax match snipComplete /<<.*>>/hs=s-2 containedin=TOP

highlight snipDelim guibg=#2b282c
highlight texDocType guifg=#ffd866
highlight texTypeStyle guifg=#a9dc76
highlight texSection guifg=#ffd866 cterm=bold
highlight texRefZone guifg=#4d5e8b cterm=bold
highlight snipComplete guibg=#ffd866 guifg=#2b282c
highlight texTodo guibg=#a9dc76 guifg=#e52ae8 cterm=bold
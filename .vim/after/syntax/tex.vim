syntax match texTodo /\\todo{.*}/ containedin=texDocZone
syntax match snipComplete /<<.*>>/hs=s-1 containedin=texDocZone



highlight texDocType guifg=#ffd866
highlight texTypeStyle guifg=#ffd866
highlight texSection guifg=#ffd866 cterm=bold
highlight texRefZone guifg=#4d5e8b cterm=bold
highlight snipComplete guibg=#ffd866 guifg=#2b282c
highlight texTodo guibg=#802020 guifg=#e52ae8 cterm=bold
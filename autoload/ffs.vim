" config

let s:filetype_schema = {
      \ 'vim': 'vimscript',
      \ }

" public functions

function! ffs#search(...)
  let ft = &filetype
  let scope = get(s:filetype_schema, ft, ft)
  if empty(a:1)
    let query = expand('<cword>')
  else
    let query = a:1
  endif
  call system(printf('open "https://www.google.com/search?q=%s+%s"', scope, query))
endfunction

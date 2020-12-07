" config

let s:filetype_schema = {
  \ 'vim': 'vimscript',
  \ 'cpp': 'c++',
\ }
let s:custom_schema = get(g:, 'ffs_schema', {})

" public functions

function! ffs#search(default, ...)
  let scope = s:get_scope(a:default)
  if empty(a:1)
    let query = expand('<cword>')
  else
    let query = a:1
  endif
  let q = s:sanitize_string(query)
  call system(printf('open "https://www.google.com/search?q=%s+%s"', scope, q))
endfunction

" utility functions

function! s:get_scope(default)
  if !a:default && exists('b:ffs_scope')
    let scope = b:ffs_scope
  else
    let ft = &filetype
    let schema = extend(copy(s:filetype_schema), s:custom_schema)
    let scope = get(schema, ft, ft)
  endif
  return s:sanitize_string(scope)
endfunction

function! s:sanitize_string(string)
  return s:url_encode(a:string)
endfunction

" url encode a string. ie. percent-encode characters as necessary.
" credit to http://www.danielbigham.ca/cgi-bin/document.pl?mode=Display&DocumentID=1053
function! s:url_encode(string)
  let result = ""

  let characters = split(a:string, '.\zs')
  for character in characters
    if character == " "
      let result = result . "+"
    elseif s:character_requires_url_encoding(character)
      let i = 0
      while i < strlen(character)
        let byte = strpart(character, i, 1)
        let decimal = char2nr(byte)
        let result = result . "%" . printf("%02x", decimal)
        let i += 1
      endwhile
    else
      let result = result . character
    endif
  endfor

  return result
endfunction

" returns 1 if the given character should be percent-encoded in a url encoded
" string.
" credit to http://www.danielbigham.ca/cgi-bin/document.pl?mode=Display&DocumentID=1053
function! s:character_requires_url_encoding(character)
  let ascii_code = char2nr(a:character)
  if ascii_code >= 48 && ascii_code <= 57
    return 0
  elseif ascii_code >= 65 && ascii_code <= 90
    return 0
  elseif ascii_code >= 97 && ascii_code <= 122
    return 0
  elseif a:character == "-" || a:character == "_" || a:character == "." || a:character == "~"
    return 0
  endif

  return 1
endfunction

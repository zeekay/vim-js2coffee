if !exists("g:js2coffee_loaded")
    let g:js2coffee_loaded = 1
else
    finish
endif

function! s:Js2Coffee(...)
  if a:0 == 1
    let coffeefile = a:1
  else
    let filename = expand('%:p')
    let coffeefile = fnamemodify(filename, ':r').'.coffee'
  endif
  exe 'vnew '.coffeefile
  normal Gdgg
  exe '0read '.filename
  silent exe '%!js2coffee'
endfunction

command! -nargs=? Js2Coffee call s:Js2Coffee(<f-args>)

function! s:Js2Coffee()
  let l:fn = expand('%:p')
  let l:coffee = fnamemodify(l:fn, ':r').'.coffee'
  exe 'vnew '.l:coffee
  let l:result = system('cat '.l:fn.' | js2coffee')
  0put=l:result
  normal Gdd
endfunction

au FileType javascript command! Js2Coffee call s:Js2Coffee()

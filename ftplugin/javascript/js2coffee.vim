if !exists("g:js2coffee_loaded")
    let g:js2coffee_loaded = 1
else
    finish
endif

if !exists('g:js2coffee_use_split')
    let g:js2coffee_use_split = 1
endif

if !exists('g:js2coffee_split_cmd')
    let g:js2coffee_split_cmd = 'vnew'
endif

function! s:Js2Coffee(...)
    if !executable('js2coffee')
        if executable('npm')
            exe '!npm install -g js2coffee'
        else
            echoerr 'Please npm install -g js2coffee first!'
            return
        endif
    endif

    if a:0 == 1
        let coffeefile = a:1
    else
        let filename = expand('%:p')
        let coffeefile = fnamemodify(filename, ':r').'.coffee'
    endif

    if eval('g:js2coffee_use_split')
        let cmd = eval('g:js2coffee_split_cmd')
        exe cmd.' '.coffeefile
    else
        exe 'edit '.coffeefile
    endif

    normal Gdgg
    exe '0read '.filename
    silent exe '%!js2coffee'
endfunction

command! -buffer -nargs=? Js2Coffee call s:Js2Coffee(<f-args>)

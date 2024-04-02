lua require('init')
autocmd BufRead,BufEnter *.component.html set filetype=angular
autocmd FileType angular setlocal commentstring=<!--%s-->


 " let g:loaded_python_provider = 1
 " let g:loaded_python3_provider = 0
"let g:python_host_prog  = '/usr/bin/python2.7'
let s:node_host_prog = expand('$APPDATA\npm\node_modules\neovim\bin\cli.js')
if filereadable(fnameescape(s:node_host_prog))
  let g:node_host_prog = fnameescape(s:node_host_prog)
else
  unlet! g:node_host_prog
endif
let g:python3_host_prog = 'C:\Users\PC1-MARKETING\AppData\Local\Programs\Python\Python310\python.exe'

" let g:ruby_host_prog ='/home/ject/.local/share/gem/ruby/3.0.0/bin/neovim-ruby-host'
"
 "perl"
 "let g:loaded_perl_provider = '/usr/bin/perl'

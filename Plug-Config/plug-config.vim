"Tecla Leader
let mapleader=','


"  nerdtree
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeMapOpenInTab='\t'
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>
"airline
let g:airline_powerline_fonts = 1
"iconos


" coc
autocmd FileType python let b:coc_suggest_disable = 0
autocmd FileType javascript let b:coc_suggest_disable = 0
autocmd FileType scss setl iskeyword+=@-@

"Css
setlocal iskeyword+=-
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END
:highlight VendorPrefix guifg=#00ffff gui=bold
:match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/

"indent
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_defaultGroup = 'SpecialKey'


"javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1



""GUI
" colorscheme gruvbox
" let g:gruvbox_italic=1
" let g:gruvbox_termcolors = 256
" let g:gruvbox_bold=1
" let g:gruvbox_underline = 1
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_undercurl = 1
" let g:gruvbox_invert_indent_guides = 1
" let g:gruvbox_transparent_bg = 1
"  nerdtree
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let g:NERDTreeWinPos = "right"
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeMapOpenInTab='\t'
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>
nnoremap gn :tabprevious<CR>
nnoremap gt :tabnext<CR>



"Key Leader
let mapleader=","

"NerdTree ++
"let g:NERDTreeGitStatusIndicatorMapCustom = {
"                \ 'Modified'  :'✹',
"                \ 'Staged'    :'✚',
"                \ 'Untracked' :'✭',
"                \ 'Renamed'   :'➜',
"                \ 'Unmerged'  :'═',
"                \ 'Deleted'   :'✖',
"                \ 'Dirty'     :'✗',
"                \ 'Ignored'   :'☒',
"                \ 'Clean'     :'✔︎',
"                \ 'Unknown'   :'?',
"                \ }
"
"let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
"let g:NERDTreeGitStatusUntrackedFilesMode = 'all' " a heavy feature too. default: normal
"let g:NERDTreeGitStatusGitBinPath = '/your/file/path' " default: git (auto find in path)
"let g:NERDTreeGitStatusShowClean = 1 " default: 0
"let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0
"
" Open the existing NERDTree on each new tab.
" COC plugins
let g:coc_global_extensions = [
      \'coc-json', 'coc-git', 'coc-pairs', 
      \ 'coc-css', 'coc-tsserver', 'coc-highlight', 'coc-marketplace',
      \ 'coc-snippets', 'coc-html', 'coc-format-json', 'coc-tslint-plugin',
      \ 'coc-jedi', 'coc-webpack', 'coc-pydocstring', 'coc-prettier', 'coc-pyright',
      \ 'coc-svg', 'coc-diagnostic', 'coc-emmet', 'coc-terminal', 'coc-translator',
      \ 'coc-sourcekit', 'coc-tslint-plugin', 'coc-rainbow-fart', 'coc-github',
      \ 'coc-htmldjango', 'coc-angular', 'coc-eslint', 'coc-flutter', 'coc-flutter-tools']


"WEBicons
" Can be enabled or disabled
let g:webdevicons_enable_nerdtree = 1
" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1
" Can be enabled or disabled
" adding the custom source to unite
let g:webdevicons_enable_unite = 1
" Can be enabled or disabled
" add glyphs to all modes
let g:webdevicons_enable_ctrlp = 1
" Can be enabled or disabled
" adding to vim-startify screen
let g:webdevicons_enable_startify = 1
" Can be enabled or disabled
" adding to flagship's statusline
let g:webdevicons_enable_flagship_statusline = 1



""statusBar
"let g:lightline = {
"\ 'component_function': {
"\   'filetype': 'MyFiletype',
"\   'fileformat': 'MyFileformat',
"\ }
"\ }

"function! MyFiletype()
"return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
"endfunction

"function! MyFileformat()
"return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
"endfunction



"let g:lightline.component_expand = {
"\  'linter_checking': 'lightline#ale#checking',
"\  'linter_infos': 'lightline#ale#infos',
"\  'linter_warnings': 'lightline#ale#warnings',
"\  'linter_errors': 'lightline#ale#errors',
"\  'linter_ok': 'lightline#ale#ok',
"\ }

"let g:lightline.component_type = {
"\     'linter_checking': 'right',
"\     'linter_infos': 'right',
"\     'linter_warnings': 'warning',
"\     'linter_errors': 'error',
"\     'linter_ok': 'right',
"\ }


"let g:lightline.active = {
"\ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
"\            [ 'lineinfo' ],
"\            [ 'percent' ],
"\            [ 'fileformat', 'fileencoding', 'filetype'] ] }



"let g:lightline#ale#indicator_checking = "\uf110"
"let g:lightline#ale#indicator_infos = "\uf129"
"let g:lightline#ale#indicator_warnings = "\uf071"
"let g:lightline#ale#indicator_errors = "\uf05e"
"let g:lightline#ale#indicator_ok = "\uf00c"



"indent
let g:indentLine_setColors = 0
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char_list = ['|', '¦', '┆', '┊',]
let g:indentLine_bgcolor_gui = ''
let g:indentLine_conceallevel = 2

""Syntaxis new
"let g:polyglot_disabled = ['markdown']
"let g:polyglot_disabled = ['sensible']
"let g:polyglot_disabled = ['autoindent']
""Syntaxis
let g:syntastic_quiet_messages = { "type": "style" }



""Erorres
""ALE
"Vista de erores
let g:ale_sign_error = '☠'
let g:ale_sign_warning = '⚠'
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']

" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'eslint']
" Equivalent to the above.
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}

"let g:ale_linters = {
"      \   'python': ['flake8', 'pylint', 'pyright'],
"      \   'ruby': ['standardrb', 'rubocop'],
"      \   'javascript': ['eslint'],
"      \}

"" g:ale_disable_lsp = 0



"Css
setlocal iskeyword+=-
augroup VimCSS3Syntax
autocmd!

autocmd FileType css setlocal iskeyword+=-
augroup END
:highlight VendorPrefix guifg=#00ffff gui=bold
:match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/

"javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

augroup javascript_folding
au!
au FileType javascript setlocal foldmethod=syntax
augroup END

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

set conceallevel=0


"python sintaxys
let g:python_highlight_class_vars = 1
let g:python_highlight_operators = 1
let g:python_highlight_all = 1
let g:python_highlight_func_calls = 1
let g:python_highlight_builtins = 1
let g:python_highlight_builtin_objs = 1
let g:python_highlight_builtin_types = 1
let g:python_highlight_builtin_funcs = 1
let g:python_highlight_builtin_funcs_kwarg = 1
let g:python_slow_sync = 1


""python jedi
"let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#show_call_signatures = "1"



"COC
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
set signcolumn=number
else
set signcolumn=yes
endif

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()  
" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()


" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
 nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
 
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-6> :TmuxNavigatePrevious<cr>



"Fzf
let g:ackprg = 'ag --nogroup --nocolor --column'

map <C-g> :Ag
nnoremap <C-p> :Files<Cr>

"terminal

nnoremap <F7> :call vimterm#toggle() <CR>
tnoremap <F7> <C-\><C-n>:call vimterm#toggle() <CR>


"Fluter
let g:flutter_hot_reload_on_save = 1 
let g:hot_reload_on_save=1
let g:flutter_command = "/opt/flutter/bin/flutter"
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

let g:lsc_auto_map = v:true

"Dart / Flutter
let g:dart_format_on_save = 1



set completeopt=menuone,noselect,longest

" NOTE: You can use other key to expand snippet.

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

"If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']



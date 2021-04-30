" [coc-tsserver] npm install -g typescript typescript-language-server typescript-styled-plugin
" [coc-eslint] npm install -g eslint
" [coc-css] npm install -g vscode-css-languageserver-bin
" [coc-solargraph] gem install solargraph
" [coc-python] pip3 install python-language-server
let g:coc_global_extensions = [
  \ 'coc-calc',
  \ 'coc-css',
  \ 'coc-diagnostic',
  \ 'coc-eslint',
  \ 'coc-jest',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-python',
  \ 'coc-solargraph',
  \ 'coc-syntax',
  \ 'coc-tabnine',
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-vimlsp',
\ ]

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

if g:colors_name ==# 'candle'
  autocmd vimrc BufWinEnter,WinEnter *
    \ call candle#highlight('CocErrorSign', 'red', '', '') |
    \ call candle#highlight('CocWarningSign', 'yellow', '', '') |
    \ call candle#highlight('CocInfoSign', 'blue', '', '') |
    \ call candle#highlight('CocHintSign', 'green', '', '') |
    \ call candle#highlight('CocErrorHighlight', 'red', '', 'undercurl') |
    \ call candle#highlight('CocWarningHighlight', 'yellow', '', 'undercurl') |
    \ call candle#highlight('CocInfoHighlight', 'blue', '', 'undercurl') |
    \ call candle#highlight('CocHintHighlight', 'green', '', 'undercurl')
endif

" Highlight the symbol and its references when holding the cursor.
autocmd vimrc CursorHold * silent call CocActionAsync('highlight')

" Update signature help on jump placeholder.
autocmd vimrc User CocJumpPlaceholder silent call CocActionAsync('showSignatureHelp')

"  Custom actions
"-----------------------------------------------
nnoremap <silent> <Plug>(coc-hover) :call CocAction('doHover')<CR>
nnoremap <silent> <Plug>(coc-peek-definition) :call CocAction('jumpDefinition', v:false)<CR>
nnoremap <silent> <Plug>(coc-peek-type-definition) :call CocAction('jumpTypeDefinition', v:false)<CR>

command! -nargs=0 -range=% Format
  \ if <range> == 0 |
  \   call CocAction('format') |
  \ else |
  \   call CocAction('formatSelected', visualmode()) |
  \ endif

"  Key mappings
"-----------------------------------------------
" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-Space> coc#refresh()

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Refactoring
nmap gr <Plug>(coc-rename)
nmap gq <Plug>(coc-codeaction)

" GoTo code navigation.
nmap gd <Plug>(coc-definition)
nmap gD <Plug>(coc-peek-definition)
nmap gh <Plug>(coc-hover)
nmap gt <Plug>(coc-type-definition)
nmap gT <Plug>(coc-peek-type-definition)
nmap gR <Plug>(coc-references)
nmap gi <Plug>(coc-implementation)

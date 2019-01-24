

" Set tabs for ruby
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
" Set tabs for scss
autocmd FileType scss setlocal expandtab shiftwidth=2 tabstop=2
" Set tabs for objective-c
autocmd FileType objc setlocal expandtab shiftwidth=4 tabstop=4
" Set tabs for swift
autocmd FileType swift setlocal expandtab shiftwidth=4 tabstop=4


" Vimwiki
filetype plugin indent on
let g:vimwiki_list = [{'path': '$HOME/xdev/wiki'}]
let g:vimwiki_dir_link = 'index'
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1

" Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
map s <Plug>(easymotion-overwin-f)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
" keep cursor column when JK motion
let g:EasyMotion_startofline = 0

" Japanese search in romaji
let g:EasyMotion_use_migemo = 1

" Expand code with Emmet with tab key

" Don't use Emmet everywhere (don't go crazy)
let g:user_emmet_install_global=0
autocmd FileType html,css,jsx EmmetInstall

" Emmet support in JSX
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

" ag.vim
let g:ag_working_path_mode="r"

" prettier
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre *.jsx,*.js,*.ts,*.tsx,*.json PrettierAsync

" max line lengh that prettier will wrap on
let g:prettier#config#print_width = 120

" number of spaces per indentation level
let g:prettier#config#tab_width = 2

" use tabs over spaces
let g:prettier#config#use_tabs = 'false'

" print semicolons
let g:prettier#config#semi = 'true'

" single quotes over double quotes
let g:prettier#config#single_quote = 'false'

" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'

" put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'true'

" none|es5|all
let g:prettier#config#trailing_comma = 'all'

" flow|babylon|typescript|postcss|json|graphql
let g:prettier#config#parser = 'babylon'

" JSX
let g:jsx_ext_required = 0

" deoplete
let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
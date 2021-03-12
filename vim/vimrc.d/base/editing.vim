"=== Fast <C-o> hack
"==============================================================================================
function! s:insert_enter()
  set eventignore+=InsertLeave,InsertEnter
  return ''
endfunction

function! s:insert_leave()
  set eventignore-=InsertLeave,InsertEnter
  return "\<C-r>\<Esc>" | " Fix for missing screen update
endfunction

inoremap <expr> <Plug>(insert-enter) <SID>insert_enter()
inoremap <expr> <Plug>(insert-leave) <SID>insert_leave()


"=== Editing
"==============================================================================================
" Indent
set noautoindent
set smartindent
set cindent
set smarttab
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=0
set shiftround

" Change soft-indent size
command! -nargs=1 SoftTab :setl expandtab tabstop=<args> shiftwidth=<args>

" Enable selection of rectangles
set virtualedit& virtualedit+=block

" Don't automatically comment lines on enter
set formatoptions-=ro

" Remove comment symbols when joining lines
if has('gui_running')
  set formatoptions+=j
endif

" Shortcut

" edit configurations
command! Vimrc edit $MYVIMRC
command! VimrcReload so $MYVIMRC
command! Dotfiles exec 'lcd' g:env.path.dotfiles
command! MacVim exec 'lcd' g:env.path.runtime

" Disable arrow keys
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" Move cursor visually with long lines
nmap j gj
vmap j gj
nmap k gk
vmap k gk

" Paste
inoremap <C-v> <C-r><C-p>*
cnoremap <C-v> <C-r>*

inoremap <C-\> <C-v>
cnoremap <C-\> <C-v>

" Prevent copy and cutting from being stored in the register
nnoremap x "_x
nnoremap X "_X
nnoremap c "_c
nnoremap C "_C
vnoremap c "_c
vnoremap x "_x

" Undo
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

" Yank til end of line
nnoremap Y y$

" Keep the cursor in place while joining lines
nnoremap J mZJ`ZmZ

" Split lines: inverse of J
nnoremap <silent> K ylpr<Enter>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Easy key
nnoremap <Space>h g^ " Start of line
nnoremap <Space>l g$ " End of line
nnoremap <Space>m %  " Matching braces
vnoremap <Space>h g^ " Start of line
vnoremap <Space>l g$ " End of line
vnoremap <Space>m %  " Matching braces

" Insert blank lines without going into insert mode
nnoremap <Space>o mZo<Esc>`ZmZ
nnoremap <Space>O mZO<Esc>`ZmZ

" Reselect pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Select all
map <Space>a ggVG

" Avoid suicide
nnoremap ZQ <Nop>

" Save a file as root (<leader>W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Disable annoying bug when using uppercase K in visual mode
vnoremap K <Nop>

" Sort lines inside block
nnoremap <leader>sor ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Tags
nnoremap tn :tn<CR>
nnoremap tp :tp<CR>
nnoremap tl :tags<CR>

nnoremap <C-]> g<C-]>

" Tab pages / buffers
nmap <C-w><C-t> <C-w>t
nnoremap <C-w>t :tabnew<CR>

nmap <C-w><C-v> <C-w>v
nnoremap <C-w>v :vnew<CR>

nmap <C-w><C-s> <C-w>s
nnoremap <C-w>s :split +enew<CR>

nmap <C-w><C-c> <Nop>
nnoremap <C-w>c <Nop>

nmap <C-w><C-d> <C-w>d
nnoremap <C-w>d :quit<CR>

nnoremap <C-w><C-n> gt
nnoremap <C-w><C-b> gT

nnoremap tn    :tabnew<CR>
nnoremap tk    :tabnext<CR>
nnoremap tj    :tabprev<CR>
nnoremap th    :tabfirst<CR>
nnoremap tl    :tablast<CR>

" Map <tab> and <shift-tab> to cycle between tabs
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:tabnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:tabprev<CR>

" Remove trailing spaces before saving
autocmd vimrc BufWritePre *
  \ if &ft != 'markdown' |
    \ :%s/\s\+$//ge |
  \ endif

" Convert tabs to soft tabs if expandtab is set before saving
autocmd vimrc BufWritePre *
  \ if &et |
    \ exec "%s/\t/" . repeat(' ', &tabstop) . "/ge" |
  \ endif

" Back to the last line I edited
autocmd vimrc BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \ exe "normal! g`\"" |
  \ endif

" Numbering selection in visual-block mode
nnoremap <silent> sc :ContinuousNumber <C-a><CR>
vnoremap <silent> sc :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber
  \ let c = col('.') |
  \ for n in range(1, <count>?<count>-line('.'):1) |
    \ exec 'normal! j' . n . <q-args> |
    \ call cursor('.', c) |
  \ endfor

" Enable I, A for all visual modes
vnoremap <expr> I <SID>force_blockwise_visual('I')
vnoremap <expr> A <SID>force_blockwise_visual('A')

let s:blockwise_visual_paste = 0

function! s:force_blockwise_visual(next_key)
  let l:m = mode()

  let s:blockwise_visual_paste = 1
  set paste

  if l:m ==# 'v'
    return "\<C-v>" . a:next_key
  elseif l:m ==# 'V'
    return "\<C-v>0o$" . a:next_key
  else
    return a:next_key
  endif
endfunction

" Easily edit a new file in the current directory
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

" Search and replace the current word
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Auto complete html tags
inoremap <buffer> <C-s> <esc>yiwi<lt><esc>ea></><esc>hpF>a

" Search current word in project
nnoremap <Leader>d :<C-u>Rg <C-r><C-w><CR>

" Kotlin
" Four spaces tab width
autocmd Filetype kotlin setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

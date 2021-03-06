" === Environment
" ==============================================================================================
" Encoding
set encoding=utf-8 nobomb
scriptencoding utf-8

" Unregister autocommands
augroup vimrc
  autocmd!
augroup END

" let g:python3_host_prog = "/usr/local/Cellar/python@3.8/3.8.3/bin/python3"

" g:env
function! s:vimrc_environment()
  let l:env = {}

  let l:dotfiles_path = $DOTFILES_PATH
  if empty(l:dotfiles_path)
    let l:dotfiles_path = $HOME . '/dotfiles'
  endif

  let l:vim_path = l:dotfiles_path . '/vim'

  let l:env.path = {
    \ 'dotfiles':       l:dotfiles_path,
    \ 'dein':           l:vim_path . '/dein',
    \ 'dein_repo':      l:vim_path . '/dein/repos/github.com/Shougo/dein.vim',
    \ 'dein_toml':      l:vim_path . '/dein.toml',
    \ 'dein_lazy_toml': l:vim_path . '/dein_lazy.toml',
    \ 'vimrcd':         l:vim_path . '/vimrc.d',
    \ 'runtime':        '/usr/local/opt/macvim/MacVim.app/Contents/Resources/vim/runtime',
  \ }

  return l:env
endfunction

let g:env = s:vimrc_environment()

" === Plugins
" ==============================================================================================
" This is no longer enabled by default for Neovim,
" but it's here in case it's running in a different environment
if &compatible
  set nocompatible
endif

if has('vim_starting') " Only on startup, not running if this file is manually sourced
  " Runtime path, to load plugins from a subdirectory
  " in this case used to load dein
  let &g:rtp .= ',' . g:env.path.dein_repo
endif

let g:dein#_plugins = {}

" Configure dein
if dein#load_state(g:env.path.dein)
  call dein#begin(g:env.path.dein, [expand('<sfile>'), g:env.path.dein_toml, g:env.path.dein_lazy_toml])

  call dein#load_toml(g:env.path.dein_toml,      { 'lazy': 0 })
  call dein#load_toml(g:env.path.dein_lazy_toml, { 'lazy': 1 })

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on


" === Load
" ==============================================================================================
function! s:load_file(file)
  let l:file = g:env.path.vimrcd . '/' . a:file . '.vim'

  if filereadable(l:file)
    execute 'source ' . l:file
  else
    echomsg 'could not read file:' l:file
  endif
endfunction

call s:load_file('base/encoding')
call s:load_file('base/base')
call s:load_file('base/appearance')
call s:load_file('base/tab_and_status')
call s:load_file('base/editing')
call s:load_file('base/utils')

call s:load_file('custom/auto_save')
call s:load_file('custom/last_closed_buffer')
call s:load_file('custom/project_dir')
call s:load_file('custom/text_objects')

if dein#tap('dein.vim')
  call s:load_file('plugin/dein')
endif
if dein#tap('coc.nvim')
  call s:load_file('plugin/coc')
endif
if dein#tap('fzf.vim')
  call s:load_file('plugin/fzf')
endif
if dein#tap('nerdcommenter')
  call s:load_file('plugin/nerdcommenter')
endif
if dein#tap('surround.vim')
  call s:load_file('plugin/surround')
endif
if dein#tap('emmet-vim')
  call s:load_file('plugin/emmet')
endif
if dein#tap('vim-easymotion')
  call s:load_file('plugin/easymotion')
endif
if dein#tap('vim-go')
  call s:load_file('plugin/go')
endif
if dein#tap('vim-javascript')
  call s:load_file('plugin/javascript')
endif
if dein#tap('vim-terraform')
  call s:load_file('plugin/terraform')
endif
" if dein#tap('vim-textobj-multiblock')
"   call s:load_file('plugin/vim-textobj-multiblock')
" endif
" if dein#tap('vim-easy-align')
"   call s:load_file('plugin/vim-easy-align')
" endif
" if dein#tap('operator-camelize.vim')
"   call s:load_file('plugin/operator-camelize')
" endif
" if dein#tap('vim-operator-replace')
"   call s:load_file('plugin/vim-operator-replace')
" endif
" if dein#tap('lexima.vim')
"   call s:load_file('plugin/lexima')
" endif
" if dein#tap('switch.vim')
"   call s:load_file('plugin/switch')
" endif
" if dein#tap('vim-textmanip')
"   call s:load_file('plugin/vim-textmanip')
" endif
" if dein#tap('mold.vim')
"   call s:load_file('plugin/mold')
" endif
" if dein#tap('vim-minisnip')
"   call s:load_file('plugin/vim-minisnip')
" endif
" if dein#tap('nerdtree')
"   call s:load_file('plugin/nerdtree')
" endif
" if dein#tap('denite.nvim')
"   call s:load_file('plugin/denite')
" endif
" if dein#tap('vim-altr')
"   call s:load_file('plugin/vim-altr')
" endif
" if dein#tap('vim-quickrun')
"   call s:load_file('plugin/vim-quickrun')
" endif
" if dein#tap('neomake')
"   call s:load_file('plugin/neomake')
" endif
" if dein#tap('vim-submode')
"   call s:load_file('plugin/vim-submode')
" endif
" if dein#tap('vim-tags')
"   call s:load_file('plugin/vim-tags')
" endif
" if dein#tap('vim-signature')
"   call s:load_file('plugin/vim-signature')
" endif
" if dein#tap('vim-anzu')
"   call s:load_file('plugin/vim-anzu')
" endif
" if dein#tap('echodoc.vim')
"   call dein#call_hook('echodoc.vim')
" endif

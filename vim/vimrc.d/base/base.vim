" Disable builtin plugins
let g:loaded_gzip               = 1
let g:loaded_tar                = 1
let g:loaded_tarPlugin          = 1
let g:loaded_zip                = 1
let g:loaded_zipPlugin          = 1
let g:loaded_rrhelper           = 1
let g:loaded_2html_plugin       = 1
let g:loaded_vimball            = 1
let g:loaded_vimballPlugin      = 1
let g:loaded_getscript          = 1
let g:loaded_getscriptPlugin    = 1
let g:loaded_netrw              = 1
let g:loaded_netrwPlugin        = 1
let g:loaded_netrwSettings      = 1
let g:loaded_netrwFileHandlers  = 1
let g:loaded_logipat            = 1

" Configure runtime features
let g:omni_sql_no_default_maps = 1
let g:tex_flavor = 'latex'

" Change cursor shape in iTerm
if !has('gui_running') && exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
endif

" Use comma as leader
let g:mapleader = ','

" Split to right / bottom
set splitright
set splitbelow

" Line offset when scrolling
set scrolloff=5

" Disable automatic line wrapping
set textwidth=0

" Disable backup and swap files
set nobackup
set noswapfile

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Reload files when modified outside of vim
set autoread

" Delete over lines and indents
" Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode.
set backspace=indent,eol,start

" Add multibyte option
set formatoptions& formatoptions+=lmoq

" Disable beeps
set visualbell t_vb=

" Disable error bells
set noerrorbells

" Set the initial directory of the file browser to that of the related buffer
set browsedir=buffer

" Move cursor over lines
set whichwrap=b,s,h,l,<,>,[,]

" Display commands in statusline
set showcmd

" Unnecessary, use lightline
set noshowmode

" Configure viminfo
" Remember marks for last 50 files
" Contents of register up to 100 lines each
" Skip register with more than 100 kbytes
set viminfo='50,<1000,s100

" Disable mode lines
" Mode lines allow vim options to be set in comments in the beginning
" or end of a file
set modelines=0

" Enhance command-line completion
if has("wildmenu")
  set wildmenu " Enables a menu at the bottom of the vim/gvim window
  set wildmode=longest,full " Similar autocomplete as in the shell

  " Ignore unimportant files
  set wildignore+=*.a,*.o
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
  set wildignore+=.DS_Store,.git,.hg,.svn
  set wildignore+=*~,*.swp,*.tmp
endif

" Fast terminal connection
set ttyfast

" Command history
set history=1000

" Enable dictionaries for completion
set complete=k

" Yank use system clipboard
if $TMUX == ''
  set clipboard=unnamed
endif

" Increment/decrement
set nrformats=alpha,hex

" Disable IME
set imdisable

" Prevent hidden buffers
set nohidden

" Use Blowfish algorithm
if exists('&cryptmethod')
  set cryptmethod=blowfish
endif

" Lower the priority of files with the following suffixes
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Find file with suffixes
set suffixesadd& suffixesadd+=.js,.jsx,.ts,.tsx,.swift,.scss,.css,.go

" Fast update
set updatetime=200

" Go bck to the beginning of a file when it reaches the end during a search
set wrapscan

" Ignore case only if contains upper case
set ignorecase
set smartcase

" Incremental search
set incsearch

" Match highlight
set hlsearch

" Enable matching of <> pairs
set matchpairs+=<:>

" Add the g flag to search/replace by default
set gdefault

" Dim match highlight
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

" Erase previous match highlight
autocmd vimrc BufReadPost * :nohlsearch

" Search selection
vnoremap <Space>/ "xy/<C-r>=escape(@x, '\\/.*$^~')<CR>

" Replace selection
vnoremap <Space>r "xy:%s/<C-r>=escape(@x, '\\/.*$^~')<CR>/

" Replace word under cursor
nnoremap <Space>* "xyiw:%s/\<<C-r>=escape(@x, '\\/.*$^~')<CR>\>/

" Auto escaping
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'

" ag
if executable('ag')
  set grepprg=ag\ --nogroup\ -iS
  set grepformat=%f:%l:%m
endif

" Spell checking in American English
set spelllang=en_us
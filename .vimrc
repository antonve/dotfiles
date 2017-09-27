" Enable syntax highlighting
syntax enable
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Use the Solarized Dark theme
set t_Co=256
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
"colorscheme solarized
colorscheme Benokai

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
"if $TMUX == ''
set clipboard=unnamed
"endif
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
" Use spaces instead of tabs
set shiftwidth=2
set tabstop=2
set expandtab
" Set tabs for ruby
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
" Show “invisible” characters
"set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" Pathogen
execute pathogen#infect()

" Vimwiki
filetype plugin indent on
let g:vimwiki_list = [{'path': '$HOME/xdev/wiki'}]
let g:vimwiki_dir_link = 'index'
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1

" Tab shortcuts
nnoremap tn		:tabnew<Space>
nnoremap tk		:tabnext<CR>
nnoremap tj		:tabprev<CR>
nnoremap th		:tabfirst<CR>
nnoremap tl		:tablast<CR>

" Vim airline
let g:airline_powerline_fonts = 1

" Insert newline without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
let g:EasyMotion_smartcase = 1 " Turn on case insensitive feature

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" NERDTree
nmap <silent> <C-D> :NERDTreeToggle<CR>

" Cancel search
nnoremap <silent> <C-L> :noh<CR><C-L>

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1

" Paste toggle to F10
set pastetoggle=<F10>

" Reduce delaying when pressing escape
set timeoutlen=1000 ttimeoutlen=0

" Expand code with emmet with tab key
let g:user_emmet_expandabbr_key = '<Tab>'

" CtrlP
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" ag.vim
let g:ag_working_path_mode="r"

" prettier
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre,TextChanged,InsertLeave *.jsx,*.js,*.json PrettierAsync

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

" fzf

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

function! s:is_git_repo() abort
  if executable('git')
    call system('git rev-parse --is-inside-work-tree &>/dev/null')
    if v:shell_error == 0
      return 1
    endif
  endif
  return 0
endfunction

function! s:fzf_files() abort
  if s:is_git_repo()
    GFiles
  else
    Files
  endif
endfunction

nnoremap [fzf] <Nop>
nmap <Leader>f [fzf]
nnoremap <silent> [fzf]f :<C-u>call <SID>fzf_files()<CR>
nnoremap <silent> [fzf]i :<C-u>Files<CR>
nnoremap <silent> [fzf]h :<C-u>History<CR>
nnoremap <silent> [fzf]b :<C-u>Buffers<CR>
nnoremap <silent> [fzf]l :<C-u>BLines<CR>
nnoremap <silent> [fzf]t :<C-u>Tags<CR>

command! -bang -nargs=* Ag
  \ call fzf#vim#grep(
  \   'ag --hidden --ignore-case --nogroup --color --column '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg -uu --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" buffers
" map <tab> and <shift-tab> to cycle between open buffers
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Auto remove all trailing whitespace on save
"autocmd FileType rb,js,jsx,css,scss,php,go,c,cpp BufWritePre <buffer> %s/\s\+$//e

" do not store to register with x, c
nnoremap x "_x
nnoremap X "_X
nnoremap c "_c
nnoremap C "_C
vnoremap c "_c
vnoremap x "_x

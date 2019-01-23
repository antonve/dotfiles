" Use the OS clipboard by default (on versions compiled with `+clipboard`)
if $TMUX == ''
  set clipboard=unnamed
endif

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

" Function keys that start with an <Esc> are recognized in Insert
" mode.  When this option is off, the cursor and function keys cannot be
" used in Insert mode if they start with an <Esc>.  The advantage of
" this is that the single <Esc> is recognized immediately, instead of
" after one second.
set esckeys

" Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode.
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
set noswapfile
"set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Disable folding
set nofoldenable

" Default location for new buffers
set splitbelow
set splitright

" Enable matching of pairs
set matchpairs+=<:>

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Set auto indentation
set autoindent
set smartindent

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
set softtabstop=2
set expandtab
set shiftround
" Set tabs for ruby
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
" Set tabs for scss
autocmd FileType scss setlocal expandtab shiftwidth=2 tabstop=2
" Set tabs for objective-c
autocmd FileType objc setlocal expandtab shiftwidth=4 tabstop=4
" Set tabs for swift
autocmd FileType swift setlocal expandtab shiftwidth=4 tabstop=4
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
if exists("&relativenumber") && has('gui_running')
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
" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = ['ale', 'vim-startify', 'easymotion']
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
" Show tabline bar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline_skip_empty_sections = 1

" Insert newline without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

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

" Cancel search
nnoremap <silent> <C-L> :noh<CR><C-L>

" YouCompleteMe
"let g:ycm_autoclose_preview_window_after_completion = 1

" Paste toggle to F10
set pastetoggle=<F10>

" Reduce delaying when pressing escape
set timeoutlen=1000 ttimeoutlen=0

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

" fzf

" fzf colors

let g:fzf_colors =
\ { "fg":      ["fg", "Normal"],
  \ "bg":      ["bg", "Normal"],
  \ "hl":      ["fg", "IncSearch"],
  \ "fg+":     ["fg", "CursorLine", "CursorColumn", "Normal"],
  \ "bg+":     ["bg", "CursorLine", "CursorColumn"],
  \ "hl+":     ["fg", "IncSearch"],
  \ "info":    ["fg", "IncSearch"],
  \ "border":  ["fg", "Ignore"],
  \ "prompt":  ["fg", "Comment"],
  \ "pointer": ["fg", "IncSearch"],
  \ "marker":  ["fg", "IncSearch"],
  \ "spinner": ["fg", "IncSearch"],
  \ "header":  ["fg", "WildMenu"] }

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
nnoremap <silent> [fzf]a :<C-u>Ag<CR>
nnoremap <silent> [fzf]g :<C-u>GGrep<CR>

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" will not override existing commands.
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Likewise, GFiles command with preview window
command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

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

" Prevent me from going crazy while using YouCompleteMe
" Pressing enter results in a new line, but this usually selects the current
" sugggestion in a lot of different autocompleters
":inoremap <expr> <Enter> pumvisible() ? "<Esc>a" : "<Enter>"

" Allow vim settings to be overriden in a project
silent! so .vimlocal

" Set update time for vim-gitgutter
set updatetime=250
" Vim 7.4.2201
if exists('&signcolumn')
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" Quickly edit/reload this configuration file
nnoremap gev :e $MYVIMRC<CR>
nnoremap gsv :so $MYVIMRC<CR>

" Allow buffers to be hidden when not saved
set hid

" Disable error sound
set noeb

" viminfo
set vi=%,'50
set vi+=\"100,:100
set vi+=n~/.viminfo

" expand %% to path
cabbr <expr> %% expand('%:p:h')

" deoplete
let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" NERDCommenter
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDSpaceDelims = 1

" don't close window when close buffer
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>.

" Disable annoying netrw
augroup goodbye_netrw
  au!
  autocmd VimEnter * silent! au! FileExplorer *
augroup END

" Swift linting
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
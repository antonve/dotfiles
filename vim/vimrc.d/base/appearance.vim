" Enable syntax highlighting
syntax enable

" Enable colors
set t_Co=256
if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Theme
set background=dark

if dein#tap('candle.vim')
  colorscheme candle
endif

" Always show statusline
set laststatus=2

" Always show tabline
set showtabline=2

" Always match pairs
set showmatch

" Show line numbers
set number

" Highlight the current line, be careful because this will slow down vim
set cursorline

" Don't update screen during macro and script execution
set lazyredraw

" Limit syntax highlighting on long lines
set synmaxcol=512

" Display all lines and unprintable letters in hex signage
set display& display+=lastline,uhex

" Show hidden charactors
set list
set listchars=tab:▸\ ,nbsp:∘,extends:❯,precedes:❮

" Indent wrapped lines
if has('linebreak')
  set breakindent
  let &showbreak = '   ›'
else
  let &showbreak = '›'
end

" Conceal
if has('conceal')
  set conceallevel=2 concealcursor=
endif

" Color column
set colorcolumn=90
hi ColorColumn guibg=#1f1f1f ctermbg=234


"  Custom highlight
"-----------------------------------------------
if dein#tap('candle.vim')
  " Highlight full-width space
  call candle#highlight('ZenkakuSpace', '', 'dark_red', '')
  autocmd vimrc BufWinEnter,WinEnter *
    \ call matchadd('ZenkakuSpace', '　')

  " Highlight trailing spaces
  call candle#highlight('TrailingSpace', '', 'line', '')
  autocmd vimrc BufWinEnter,WinEnter *
    \ call matchadd('TrailingSpace', '\s\+$')
endif


"  Sign column
"-----------------------------------------------
" Make sign column always visible
sign define mydummy

autocmd vimrc BufEnter * call <SID>add_dummy_sign()

function! s:add_dummy_sign()
  let l:bufnr = bufnr('')

  if !getbufvar(l:bufnr, 'my_dummy_sign')
    exec 'sign place 9999 line=1 name=mydummy buffer=' . l:bufnr
    call setbufvar(l:bufnr, 'my_dummy_sign', 1)
  endif
endfunction


"  Window title
"-----------------------------------------------
set title titlestring=%{MyTitleText()}

function! MyTitleText()
  let l:t = []

  if !empty(v:servername)
    let l:name = substitute(v:servername, 'VIM', '', '')
    if l:name ==# ''
      let l:name = '0'
    endif
    call add(l:t, '$' . l:name . ':')
  endif

  let l:session = fnamemodify(v:this_session, ':t:r')

  if l:session !=# ''
    call add(l:t, '[' . l:session . ']')
  endif

  let l:path = expand('%:p')
  let l:path = (l:path !=# '') ? l:path : getcwd()
  let l:path = substitute(l:path, $HOME, '~', '')
  let l:path = substitute(l:path, '\~/go/src/github.com', '~g', '')
  call add(l:t, l:path)

  return join(l:t, ' ')
endfunction

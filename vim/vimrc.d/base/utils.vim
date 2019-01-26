" clean up hidden buffers
command! CleanBuffers :call <SID>clean_buffers()

function! s:clean_buffers()
  redir => l:bufs
    silent buffers
  redir END

  for l:ibuf in split(l:bufs, "\n")
    let l:t = matchlist(l:ibuf, '\v^\s*(\d+)([^"]*)')
    if l:t[2] !~# '[#a+]'
      exec 'bdelete' l:t[1]
    endif
  endfor
endfunction

" Create directories when they don't exist
autocmd vimrc BufWritePre *
 \ call s:auto_mkdir(expand('<afile>:p:h'))

function! s:auto_mkdir(dir)
  if !isdirectory(a:dir)
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

" Delete current file
function! s:delete_or_trash(file)
  let l:trash_dir = $HOME . '/.Trash'
  let l:file = fnameescape(a:file)

  if empty(l:file)
    return
  endif

  if isdirectory(l:trash_dir)
    call job_start(['mv', l:file, l:trash_dir])
  else
    call delete(l:file)
  endif
endfunction

command! -nargs=0 Delete call <SID>delete_or_trash(expand('%:p')) | enew!

" Rename current file name
command! -nargs=1 -complete=file Rename f <args> | w | call delete(expand('#'))

" edit a next file in the same directory
command! -nargs=0 NextFile call <SID>next_file(1)
command! -nargs=0 PrevFile call <SID>next_file(-1)

nnoremap g9 :PrevFile<CR>
nnoremap g0 :NextFile<CR>

function! s:next_file(direction)
  let l:path = expand('%:p')
  let l:directory = fnamemodify(l:path, ':h')

  let l:paths = split(globpath(l:directory, '*'), "\n")
  let l:files = filter(l:paths, '!isdirectory(v:val)')
  let l:n = len(l:files)
  let l:idx = index(l:files, l:path)

  if l:idx >= 0
    exec 'edit' fnameescape(l:files[(l:idx + a:direction) % l:n])
  endif
endfunction

" Detect filetype on read/save
autocmd vimrc BufWritePost,BufReadPost,BufEnter *
  \ if &l:filetype ==# '' || exists('b:ftdetect') |
    \ unlet! b:ftdetect |
    \ filetype detect |
  \ endif

" Automatically change input source
if executable('osascript')
  autocmd vimrc FocusGained *
    \ call job_start(['osascript', '-e', 'tell application "System Events" to key code 102'])
endif

" Inspect syntax
command! ScopeInfo echo map(synstack(line('.'), col('.')), 'synIDattr(synIDtrans(v:val), "name")')

" Forcibly reload file
autocmd vimrc BufEnter * :silent! checktime

" Allow vim settings to be overriden in a project
silent! so .vimlocal

" Expand %% to path
cabbr <expr> %% expand('%:p:h\/'). '/'

" Don't close window when close buffer
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>.

" Strip trailing whitespace (<leader>ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

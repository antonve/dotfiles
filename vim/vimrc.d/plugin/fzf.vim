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

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Detect if the current directory is part of a git repo
function! s:is_git_repo() abort
  if executable('git')
    call system('git rev-parse --is-inside-work-tree &>/dev/null')
    if v:shell_error == 0
      return 1
    endif
  endif
  return 0
endfunction

" What files list do we want to use?
function! s:fzf_files() abort
  if s:is_git_repo()
    GFiles
  else
    Files
  endif
endfunction

" Keybindings
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

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
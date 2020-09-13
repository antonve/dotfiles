" auto select
set completeopt+=noinsert

" disable the preview window feature
set completeopt-=preview

" silence "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found", "Back at original", etc.
set shortmess+=c

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('smart_case', v:true)
call deoplete#custom#option('auto_complete_delay', 0)
call deoplete#custom#option('min_pattern_length', 1)

call deoplete#custom#source('buffer', 'min_pattern_length', 3)
call deoplete#custom#source('minisnip', 'min_pattern_length', 1)

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

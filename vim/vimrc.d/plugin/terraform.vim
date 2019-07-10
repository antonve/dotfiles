" Allow vim-terraform to align settings automatically with Tabularize.
let g:terraform_align=1

" Allow vim-terraform to automatically fold (hide until unfolded) sections of terraform code.
" Defaults to 0 which is off.
" let g:terraform_fold_sections=1

" Allow vim-terraform to re-map the spacebar to fold/unfold.
" This works in conjunction with `let g:terraform_fold_sections=1` which should be
" enabled if you plan to use this feature. Defaults to 0 which is off.
let g:terraform_remap_spacebar=1

" Override the Vim's `commentstring` setting with a custom value. Defaults to #%s.
" let g:terraform_commentstring='//%s'

" Allow vim-terraform to automatically format `*.tf` and `*.tfvars` files with `terraform fmt`.
" You can also do this manually with the `:TerraformFmt` command.
let g:terraform_fmt_on_save=1

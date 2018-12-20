func! customconfig#before() abort
  let g:ansible_unindent_after_newline = 1
  let g:terraform_align=1
  let g:terraform_fmt_on_save=1
endf

func! customconfig#after() abort
  
endf

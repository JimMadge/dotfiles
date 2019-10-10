set expandtab
set shiftwidth=2
set tabstop=2

set autoindent
set smartindent

let s:extfname = expand("%:e")
if s:extfname ==? "f77" || s:extfname ==? "f" || s:extfname ==? "for"
  let fortran_fixed_source=1
  unlet! fortran_free_source
  let fortran_fixed_source=1
  set comments=:!,:*,:C,:c
  set tw=72
  set colorcolumn=72
else
  let fortran_free_source=1
  "let fortran_fold=1
  "let fortran_fold_conditionals=1
  "set foldmethod=syntax
  let b:fortran_do_enddo = 1
  "let fortran_more_precise=1

  set tw=0
  set colorcolumn=80,132
endif

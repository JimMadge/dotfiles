setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2

setlocal autoindent
setlocal smartindent

let s:extfname = expand("%:e")
if s:extfname ==? "f77" || s:extfname ==? "f" || s:extfname ==? "for"
  let fortran_fixed_source=1
  unlet! fortran_free_source
  let fortran_fixed_source=1
  setlocal comments=:!,:*,:C,:c
  setlocal tw=72
  setlocal colorcolumn=72
else
  let fortran_free_source=1
  "let fortran_fold=1
  "let fortran_fold_conditionals=1
  "setlocal foldmethod=syntax
  let b:fortran_do_enddo = 1
  "let fortran_more_precise=1

  setlocal tw=0
  setlocal colorcolumn=80,132
endif

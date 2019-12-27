setlocal tw=80

setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2

setlocal autoindent

"turn on spell check
setlocal spell spelllang=en_gb

"vim-surround mappings for environments and commands
"(i.e. yse ysc)
let b:surround_{char2nr('e')} = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
let b:surround_{char2nr('c')} = "\\\1command: \1{\r}"

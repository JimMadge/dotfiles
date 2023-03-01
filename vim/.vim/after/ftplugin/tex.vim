setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2

setlocal autoindent

"vim-surround mappings for environments and commands
"(i.e. yse ysc)
let b:surround_{char2nr('e')} = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
let b:surround_{char2nr('c')} = "\\\1command: \1{\r}"

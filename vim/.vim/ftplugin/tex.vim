set tw=80

set expandtab
set tabstop=2
set shiftwidth=2

set autoindent
set smartindent

"turn on spell check
set spell spelllang=en_gb

"vim-surround mappings for environments and commands
"(i.e. yse ysc)
let b:surround_{char2nr('e')} = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
let b:surround_{char2nr('c')} = "\\\1command: \1{\r}"

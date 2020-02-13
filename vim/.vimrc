""""""""""""""""""""""""""""""""""""""""""""""""""
" Load vim-plug configuration
""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/plug.vim

""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""
"256 colours
set t_Co=256

set wildmenu "suggestions for autocompletion
set wildmode=list:longest "list all matches, complete until the longest common string

set ruler "Permanent position display at the bottom
set number "Show line numbers

set hlsearch "highlight search results
set incsearch "begin searching before pressing enter

set lazyredraw "don't redraw while executing macros

set showmatch "show matching brackets
set mat=2 "frequency of matching flash

set scrolloff=5 "keep five lines above or below cursor
set sidescrolloff=5 "keep five lines to the left or right of the cursor

"set new splits to open on the right or below
set splitright
set splitbelow

set list "indicate whitespace and off screen characters
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+ "list character settings

set autoread "automatically update files (can be undone with u)

let g:tex_flavor="latex"

filetype plugin on
filetype plugin indent on

syntax enable "syntax highlighting

set background=dark
colorscheme solarized

" Underline spelling mistakes (redefined in solarized package)
highlight SpellBad term=underline cterm=underline gui=undercurl guisp=Red

" Vim airline
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_julia_checkers = ["lint"]

" Easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" fzf
let g:fzf_layout = { 'down': '~30%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

""""""""""""""""""""""""""""""""""""""""""""""""""
" Indenting Settings
""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start
set expandtab "replace tabs with spaces
set shiftwidth=4 "width of indenting
set tabstop=4 "tab width in spaces
set autoindent "keeps indentation after newline

set foldlevelstart=20 "opens folds up to level 20 when opening a file

""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands and bindings
""""""""""""""""""""""""""""""""""""""""""""""""""
":C will clear search
command C let @/ = ""

"bind F12 to sync from start
"helps fix syntax highlighting
noremap <F12> <Esc>:syntax sync fromstart<CR>

" Use ]q and [q to seek through quickfix list, useful with Syntastic
noremap ]q :lnext<CR>
noremap [q :lprevious<CR>

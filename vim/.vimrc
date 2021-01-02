set nocompatible "Reduce compatibility with vi

""""""""""""""""""""""""""""""""""""""""""""""""""
" Load vim-plug configuration
""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/plug.vim

""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim configuration
""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu "suggestions for autocompletion
set wildmode=longest:full "list all matches, complete until the longest common string

set ruler "Permanent position display at the bottom
set number "Show line numbers

set showcmd "Show command on the bottom line

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
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:+,eol:↵

set autoread "automatically update files (can be undone with u)

set spelllang=en_gb
set spell

set formatoptions+=j "remove comment character when joining comment lines

" Enable filetype detection, filetype plugin loading and filetype indent
" loading
filetype plugin indent on

syntax enable "syntax highlighting

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
""""""""""""""""""""""""""""""""""""""""""""""""""
" Solarized
set background=dark
colorscheme solarized
" let g:solarized_termtrans=1 "allow transparency, doesn't work with my alacritty configuration
highlight! Normal ctermbg=NONE guibg=NONE "fallback transparency
highlight! NonText ctermbg=NONE  ctermfg=NONE guibg=NONE guifg=NONE
highlight SpellBad cterm=underline
let g:solarized_visibility='low' "Make list characters less visible

" Vim airline
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_ansible_checkers = []
let g:syntastic_julia_checkers = ["lint"]
let g:syntastic_yaml_checkers = ["yamllint"]

" Easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" fzf
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit'
    \}
let g:fzf_layout = { 'down': '~30%' }
let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
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
    \ 'header':  ['fg', 'Comment']
    \}
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fm :Marks<CR>

" vimtex
let g:tex_flavor="latex"

""""""""""""""""""""""""""""""""""""""""""""""""""
" Indenting Settings
""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start
set expandtab "replace tabs with spaces
set smarttab "<BS> will delete 'shiftwidth' spaces at the start of a line
set shiftwidth=4 "width of indenting
set tabstop=4 "tab width in spaces
set autoindent "keeps indentation after newline

set foldlevelstart=20 "opens folds up to level 20 when opening a file

""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands and bindings
""""""""""""""""""""""""""""""""""""""""""""""""""
" Make Y consistent with C, D, etc.
map Y y$

" Clear search
noremap <C-L> :let @/=""<CR>
inoremap <C-L> <Esc>:let @/=""<CR>a

" Bind F12 to sync from start, helps fix syntax highlighting
noremap <F12> <Esc>:syntax sync fromstart<CR>

" Use ]q and [q to seek through quickfix list, useful with Syntastic
noremap ]q :lnext<CR>
noremap [q :lprevious<CR>

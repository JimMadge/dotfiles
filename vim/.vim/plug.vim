" Automatically install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug '/usr/bin/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'dhruvasagar/vim-table-mode'
Plug 'JuliaEditorSupport/julia-vim', { 'for': 'julia' }
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'petrushka/vim-opencl'
Plug 'pprovost/vim-ps1', { 'for': 'ps1' }
Plug 'tmhedberg/simpylfold', { 'for': 'python' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'vim-syntastic/syntastic'

call plug#end()

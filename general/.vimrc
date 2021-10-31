" Indentation
set autoindent
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4

" Search
set nohlsearch
set incsearch

" Performance
set lazyredraw

" Text Rendering
set encoding=utf-8
set scrolloff=10
set sidescrolloff=10
set nowrap
set colorcolumn=81

" User Interface
set cursorline
set number
set relativenumber
set noerrorbells
set visualbell
set mouse=

" Miscellaneous
set confirm
set noswapfile
set spell

nnoremap Y y$

" Keep Line centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Move text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" inoremap <C-j> <esc>:m .+1<CR>==
" inoremap <C-k> <esc>:m .-2<CR>==
" nnoremap <leader>j :m .+1<CR>==
" nnoremap <leader>k :m .-2<CR>==

packadd! dracula
colorscheme dracula

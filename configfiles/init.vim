" Configuration vim variables
set relativenumber
set mouse=a
set title
set clipboard=unnamedplus
set nowrap

set colorcolumn=80
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab

set ignorecase
set spelllang=en,es

" Mark spaces and enters
set listchars=trail:.

" Reopen in the lasst line
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" -----------------------------------------------------------------------------
" Mappings
let mapleader = " "

" Ctrl + s
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

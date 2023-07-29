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

" Plugins
call plug#begin()
" Autocomplete and linters
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Whitespaces
Plug 'ntpeters/vim-better-whitespace'

" Theme
Plug 'Mofiqul/dracula.nvim'

" Tabs for files
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

" Search files
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Identation
Plug 'lukas-reineke/indent-blankline.nvim'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Rainbow parentheses
Plug 'luochen1990/rainbow'

" Plug for themes
Plug 'rafi/awesome-vim-colorschemes'

" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Arduino
Plug 'sudar/vim-arduino-syntax'
call plug#end()



" Post Config
colorscheme purify
let g:airline_theme='angr'
" -----------------------------------------------------------------------------
" Mappings
let mapleader = " "

" Telescope Config
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Ctrl + s
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Add mapping to set autocompletion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Dependencies: curl -sL install-node.vercel.app/lts | bash
" List of coc servers
" coc-cland
" coc-pyright
" coc-json
" coc-markdownlint
" coc-snippets
" coc-rust-analyzer
" coc-go
" coc-java
" coc-texlab

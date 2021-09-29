set number
set expandtab
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2
set t_Co=256
syntax on

set nocompatible
filetype off

call plug#begin(stdpath('data') . '/plugged')

Plug 'croaker/mustang-vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'moll/vim-node'
Plug 'w0rp/ale'
Plug 'Lokaltog/vim-easymotion'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'vim-syntastic/syntastic'
Plug 'derekwyatt/vim-scala'
Plug 'jacoborus/tender.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'w0ng/vim-hybrid'
Plug 'godlygeek/tabular'
Plug 'mzlogin/vim-smali'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

filetype plugin indent on

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'

let g:airline_powerline_fonts = 1 

let $FZF_DEFAULT_COMMAND='fd --type f'

" Better search
set incsearch
set ignorecase
set smartcase
set gdefault

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

set background=dark
colorscheme base16-ocean

let mapleader = ','

let b:ale_fixers = {
  \'javascript': ['prettier', 'eslint'],
  \'javascript.jsx': ['prettier', 'eslint'],
\}

" Permanent undo
set undodir=~/.vimdid
set undofile

" CtrlP mappings
nnoremap <SPACE><SPACE> :FZF<CR>
nnoremap <SPACE>b :Buffers<CR>

" NERDTree mappings
nnoremap <SPACE>f :ex .<CR>

" Vim-fugitive mappings
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>ga :Gcommit -a<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gps :Gpush<CR>
nnoremap <Leader>gpl :Gpull<CR>

" Buffer mappings
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>p :bprev<CR>

nnoremap <Leader>l :nohl<CR>

" ALE mappings
nnoremap <Leader>f :ALEFix<CR>

" Split mappings
nnoremap <Leader>= <C-W>=

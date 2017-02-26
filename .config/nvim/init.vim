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

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'croaker/mustang-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'moll/vim-node'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'vim-syntastic/syntastic'
Plugin 'derekwyatt/vim-scala'
Plugin 'ensime/ensime-vim'
Plugin 'jacoborus/tender.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'w0ng/vim-hybrid'

call vundle#end()
filetype plugin indent on

let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_smart_startup_focus=1

let mapleader = "s"

let g:airline_powerline_fonts = 1 

let g:deoplete#omni#input_patterns = {}
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#input_patterns.scala='[^. *\t]\.\w*'

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

"colorscheme tender
"
set background=dark
colorscheme hybrid
let g:airline_theme = 'tender'

let mapleader = ','

" Ensime mappings
nnoremap <Leader>t :EnType<CR>
nnoremap <Leader>it :EnInspectType<CR>
nnoremap <Leader>im :EnSuggestImport<CR>
nnoremap <Leader>d :EnDeclaration<CR>
nnoremap <Leader>sd :EnDeclarationSplit<SPACE>v<CR>

" CtrlP mappings
nnoremap <SPACE><SPACE> :CtrlP<CR>
nnoremap b<SPACE> :CtrlPBuffer<CR>

" NERDTree mappings
nnoremap f<SPACE> :ex .<CR>

" Vim-fugitive mappings
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gps :Gpush<CR>
nnoremap <Leader>gpl :Gpush<CR>

" Buffer mappings
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>p :bprev<CR>

set mouse=n

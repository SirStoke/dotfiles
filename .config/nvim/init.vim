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

call plug#begin('~/.local/share/nvim/plugged')

Plug 'croaker/mustang-vim'
Plug 'scrooloose/nerdtree'
Plug 'rust-lang/rust.vim'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'moll/vim-node'
Plug 'w0rp/ale'
Plug 'Lokaltog/vim-easymotion'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'leafgarland/typescript-vim'

au BufRead,BufNewFile *.sbt set filetype=scala

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

" Better search
set incsearch
set ignorecase
set smartcase
set gdefault

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

set background=dark
colorscheme base16-eighties

let mapleader = ','

let g:ale_fixers = {
  \'javascript': ['prettier', 'eslint'],
  \'javascript.jsx': ['prettier', 'eslint'],
\}

let g:airline#extensions#ale#enabled = 1

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
nnoremap <silent> <leader>b :bd<CR>

nnoremap <Leader>l :nohl<CR>

" ALE mappings
nnoremap <Leader>f :ALEFix<CR>

" Split mappings
nnoremap <Leader>= <C-W>=

" CoC settings

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>t <Plug>(coc-type-definition)
nmap <silent> <leader>i <Plug>(coc-implementation)
nmap <silent> <leader>r <Plug>(coc-references)

" Remap for do codeAction of current line
nmap <leader>c <Plug>(coc-codeaction)

" Remap for do action format
nnoremap <silent> <leader>f :call CocAction('format')<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

inoremap § <Esc>

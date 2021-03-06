syntax on

set guicursor=
set nohlsearch
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set relativenumber
set hlsearch
set cursorline
set matchpairs+=<:>

" set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey

" call plug#begin('C:/Users/Ed/.vim/plugged') " windows
call plug#begin('/home/ed/.vim/plugged') " linux
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
call plug#end()

" add tab navigation to COC intellisense
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()

let mapleader = " "

" Copy/paste from clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>x "*c
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Navigate through VIM windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" FILES navigation
nnoremap <leader>u :UndotreeShow <CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>ps :Rg<SPACE>

" move lines in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d

" Resize Window
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

" switch between header/source
nnoremap <Leader>oc :e %<.c<CR>
nnoremap <Leader>oi :e %<.cpp<CR>
nnoremap <Leader>oh :e %<.h<CR>

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart <CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

nmap <leader>f :Ag <CR>

" select all
nnoremap <leader>a ggVG

"Function for commenting a block of Visually selected text
function Comment(fl, ll)
  let i=a:fl
  let comment="//"
  while i<=a:ll
    let cl=getline(i)
    let cl2=comment.cl
    call setline(i, cl2)
    let i=i+1
  endwhile
endfunction

"Function for Un-Commenting a block of Visually selected text
function UnComment(fl, ll)
  let i=a:fl
  let comment="//"
  while i<=a:ll
    let cl=getline(i)
    let cl2=substitute(cl, "//", "", "")
    call setline(i, cl2)
    let i=i+1
  endwhile
endfunction

nnoremap <leader>/ :call Comment(".",".")<CR>
vnoremap <leader>/ :call Comment(".",".")<CR>
nnoremap <leader>' :call UnComment(".",".")<CR>
vnoremap <leader>' :call UnComment(".",".")<CR>

" brackets helpers
inoremap {<cr> {<cr>}<c-o>O
inoremap [<cr> [<cr>]<c-o>O
inoremap (<cr> (<cr>)<c-o>O

autocmd vimenter * colorscheme gruvbox
cd ~


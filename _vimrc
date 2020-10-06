syntax on
set encoding=UTF-8
set t_Co=256

" -- Keep Settings --
set relativenumber
set belloff=all
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set showmatch
set splitbelow splitright
set wildmenu
set incsearch
set nohlsearch
set hidden
set cursorline

set nocompatible
filetype off

set showcmd
set noswapfile
set noshowmode
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
" set completeopt=menuone,noinsert,noselect
set cmdheight=2
set updatetime=50
set shortmess+=c

" >> Plugins! --
call plug#begin('~/.vim/plugged')

  Plug 'tpope/vim-surround'
  Plug 'chaoren/vim-wordmotion'
  Plug 'tpope/vim-commentary'
  Plug 'vim-scripts/ReplaceWithRegister'

  " visual plugs
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'sainnhe/gruvbox-material'
  Plug 'joshdick/onedark.vim'
  Plug 'ryanoasis/vim-devicons'

  " Primeagen recommends--
  Plug 'tpope/vim-fugitive'
  Plug 'vim-utils/vim-man'
  Plug 'mbbill/undotree'
  Plug 'sheerun/vim-polyglot'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'stsewd/fzf-checkout.vim'
  Plug 'vuciv/vim-bujo'
  Plug 'tpope/vim-dispatch'
  "  Plug 'theprimeagen/vim-be-good'

call plug#end() 

" >> qol settings
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

" >> ThemeSetup--
let g:airline#extensions#tabline#enabled = 1
colorscheme onedark
set termguicolors
set background=dark
" cursor
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait600-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait275-blinkoff120-blinkon175,

" >> abbreviations
" abbr soM something

" >> Keymappings
imap ; <Esc>
vmap ; <Esc>
let mapleader = " "

" nav remaps
nnoremap J }j
nnoremap K {k
nnoremap H B
nnoremap L W
nnoremap } 9k
nnoremap { 9j

" visual remaps
vnoremap > >gv
vnoremap < <gv

" < cause i know better
nmap r gr
nnoremap R r
nnoremap S R
nnoremap , %
nnoremap U <C-r>
nnoremap Q @
nmap <CR> o<Esc>
" nnoremap <C-r> :replace all defName

" Todo add terminal hotkey

" Todo better [ ] 

" Todo split buffer/panes

"  navigate windows/buffers
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-o> <C-w>o
nnoremap gt :bnext<CR>
nnoremap gT :bprev<CR>
" nnoremap gd :GoDef<CR>

" leader maps
nnoremap <leader>' $
nnoremap <leader>a ^
nnoremap <leader>; $a;<Esc>
nnoremap <leader>, $a,<Esc>
nnoremap <leader>p "*p
nnoremap <leader>m M
nnoremap <leader>j L
nnoremap <leader>k H
nnoremap <leader>f zz
nnoremap <leader>J J
nnoremap <leader>o o<Esc>O
nnoremap <leader>s :w<CR>
nnoremap <leader>q :q<CR> 

" Imitate goto symbol clear/insert
nnoremap <leader>{ f{ci{
nnoremap <leader>} f}i
nnoremap <leader>( f(ci(
nnoremap <leader>) f)i
nnoremap <leader>[ f[ci[
nnoremap <leader>] f]i

" leader leader window/plugin actions 
nnoremap <leader><leader>u :UndotreeShow<CR>
nnoremap <leader><leader>e :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" >> For reload on vimrc save
augroup myvimrc
    au!
    au BufWritePost init.vim,.vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

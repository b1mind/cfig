syntax on
set encoding=UTF-8

" -- Keep Settings --
set relativenumber
set belloff=all
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu rnu
set nowrap
set smartcase
set showmatch
set splitbelow splitright
set wildmenu
set lazyredraw
set incsearch
set nohlsearch

set nocompatible
filetype off

set showcmd
set guicursor=
set hidden
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set noshowmode
" set completeopt=menuone,noinsert,noselect
set cmdheight=2
set updatetime=50
set shortmess+=c

" -- Plugins! --
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'chaoren/vim-wordmotion'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/gruvbox-material'
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'

" --Primeagen recommends--
Plug 'tweekmonster/gofmt.vim'
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

" --ThemeSetup--
let IsWindowsTerminal=exists("$WT_SESSION")
let g:airline#extensions#tabline#enabled = 1
colorscheme onedark
set termguicolors
set background=dark
set t_Co=256
set t_ut=""

if (&term =~ '^xterm' && &t_Co == 256)
  set t_ut= | set ttyscroll=1
endif

" ***This is not working ?? ***
if IsWindowsTerminal
  " Fix certain mouse actions
  set ttym=sgr
  " Fix Cursor Shape
  if &term =~ '^xterm'
  " normal mode
    let &t_EI .= "\<Esc>[0 q"
  " insert mode
    let &t_SI .= "\<Esc>[6 q"
  endif
  autocmd VimLeave * silent !echo -ne "\e[6 q"
endif

" add abvreviations with :abbr

" -- Keymappings --
imap ; <Esc>
imap jk <Esc>
let mapleader = " "

" >> Basic Nav remaps
nnoremap J }j
nnoremap K {k
nnoremap H B
nnoremap L W
nnoremap } 5k
nnoremap { 5j
" ***needs buffer hack make search for next {[( and goto?
" nmap <silent><nowait><buffer>[ }
" nmap <silent><nowait><buffer>] {

" >>navigate panes
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nnoremap <leader>' $
nnoremap <leader>a ^
nnoremap <leader>; $a;<Esc>
nnoremap <leader>, $a,<Esc>
nnoremap <leader>p "*p
nnoremap <leader>o o<Esc>O
nnoremap <leader>s :w<Return>
nnoremap <leader>q :q<Return>

" Imitate goto symbol clear/insert
nnoremap <leader>{ f{ci{
nnoremap <leader>} f}i
nnoremap <leader>( f(ci(
nnoremap <leader>) f)i
nnoremap <leader>[ f[ci[
nnoremap <leader>] f]i

" --For reload on vimrc save
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

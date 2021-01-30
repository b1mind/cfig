set nohlsearch
set hidden
set termguicolors

if !exists('g:vscode')
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
  set splitbelow splitright
  set cursorline
  set wildmenu
  set incsearch
  set showmatch
  set smartcase
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
endif

" >> Plugins! --
call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-surround'
  Plug 'vim-scripts/ReplaceWithRegister'
  Plug 'chaoren/vim-wordmotion'

  if !exists('g:vscode')
    Plug 'tpope/vim-commentary'

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
  endif

call plug#end() 

if !exists('g:vscode')
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

  " >> For reload on vimrc save
  augroup myvimrc
      au!
      au BufWritePost init.vim,.vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
  augroup END

"  navigate windows/buffers
  nmap <C-h> <C-w>h
  nmap <C-j> <C-w>j
  nmap <C-k> <C-w>k
  nmap <C-l> <C-w>l
  nmap <C-o> <C-w>o

  " leader leader window/plugin actions 
  nnoremap <leader><leader>u :UndotreeShow<CR>
  nnoremap <leader><leader>e :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
  nnoremap <leader>s :w<CR>
  nnoremap <leader>q :q<CR> 

endif "end not vsCode settings

"Key maps
let mapleader = " "

" nav remaps
nnoremap J }j
nnoremap K {k
nnoremap H B
nnoremap L W
nnoremap } 9k
nnoremap { 9j

" insert maps
inoremap gcp <c-p>"0p

" visual remaps
vnoremap > >gv
vnoremap < <gv
vnoremap , %
vmap r gr 
 
" < cause i know better
"FIXME gr needs to be recursive?
nmap r gr 
nnoremap R r
nnoremap S R
nnoremap , %
nnoremap U <C-r>
nnoremap Q @
nmap <CR> o<Esc>

" leader maps
nnoremap <leader>' $
nnoremap <leader>a ^
nnoremap <leader>; $a;<Esc>
nnoremap <leader>, $a,<Esc>
nnoremap <leader>p "*p
nnoremap <leader>m M
nnoremap <leader>j zb
nnoremap <leader>k zt
nnoremap <leader>f zz
nnoremap <leader>J J
nnoremap <leader>o o<Esc>O

" Imitate goto symbol clear/insert
nnoremap <leader>{ f{ci{
nnoremap <leader>} f}i
nnoremap <leader>( f(ci(
nnoremap <leader>) f)i
nnoremap <leader>[ f[ci[
nnoremap <leader>] f]i

" nnoremap <C-r> :replace all defName

" Todo add terminal hotkey

" Todo better [ ] 

" Todo split buffer/panes
if exists('g:vscode') " start vs code only settings
  nnoremap <silent> <leader>z <Cmd>call VSCodeCall('workbench.action.toggleZenMode')<CR>
  nnoremap <silent> <leader>s <Cmd>call VSCodeCall('workbench.action.files.save')<CR>
  nnoremap <silent> i <Cmd>call VSCodeCall('settings.cycle.statusBarInsert')<CR>i
  nnoremap <silent> v <Cmd>call VSCodeCall('settings.cycle.statusBarVisual')<CR>v
  nnoremap <silent> ; <Cmd>call VSCodeCall('settings.cycle.statusBarEsc')<CR><Esc>
  nnoremap <silent> ? <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>

  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine
endif

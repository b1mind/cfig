set nohlsearch
set hidden

" % for html tags use https://www.vim.org/scripts/script.php?script_id=39
filetype plugin on

  syntax on
  set encoding=UTF-8
  set t_Co=256

  " -- Keep Settings --
  set termguicolors
  set cursorline
  set incsearch
  set smartcase
  set showmatch
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
  set wildmenu
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
  Plug 'vim-scripts/ReplaceWithRegister'
  Plug 'chaoren/vim-wordmotion'
  Plug 'unblevable/quick-scope'
  "TEST THIS " Plugin 'alvan/vim-closetag'
  " Plug '/rhysd/clever-f.vim'

  " >vim plugins only
    " need to try in vsCode still

    " visual plugs
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'sainnhe/gruvbox-material'
    Plug 'joshdick/onedark.vim'
    Plug 'ryanoasis/vim-devicons'

    " Utlities
    " Plug 'lifepillar/vim-colortemplate'

    " Good
    Plug 'tpope/vim-commentary'
    " Plug 'michaeljsmith/vim-indent-object'

    " Primeagen recommends--
    Plug 'tpope/vim-fugitive'
    Plug 'vim-utils/vim-man'
    Plug 'mbbill/undotree'
    Plug 'sheerun/vim-polyglot'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'stsewd/fzf-checkout.vim'
    " Plug 'vuciv/vim-bujo'
    Plug 'tpope/vim-dispatch'
    "  Plug 'theprimeagen/vim-be-good'

" Plug install, update, help
call plug#end() 

" >vim only settings

  let mapleader = " "

  " >> qol settings
  let g:netrw_browse_split = 2
  let g:netrw_banner = 0
  let g:netrw_winsize = 25

  " >> ThemeSetup--
    "
  augroup qs_colors
    autocmd!
    " autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    " autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
    autocmd ColorScheme * highlight QuickScopePrimary gui=underline ctermfg=155 cterm=underline
    autocmd ColorScheme * highlight QuickScopeSecondary guifg='#e3e3e3' gui=underline ctermfg=81 cterm=underline
  " highlight QuickScopeSecondary guifg='#888888' gui=underline ctermfg=81 cterm=underline
  augroup END

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

  " >> For reload on vimrc save
  augroup myvimrc
      au!
      au BufWritePost init.vim,.vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
  augroup END

  " >> Key mappings VIM only
  imap ; <Esc>
  vmap ; <Esc>

  "TODO add terminal hotkey for vim opens in new buffer
  "
  "TODO split buffer/panes
  "
  "TODO map <C-t> buffer tab cycle
  
  " navigate windows/buffers
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  " mimic vsc binds
  nnoremap <C-w> <Cmd>:q<CR>

  "FIXME " nnoremap <C-r> :replace all defName vsCode
  "FIXME " nnoremap <C-/> Vgc

  " leader leader window/plugin actions 
  nnoremap <leader><leader>u :UndotreeShow<CR>
  nnoremap <leader><leader>e :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
  nnoremap <C-S-E>:wincmd v<bar> :Ex <bar> :vertical resize 30<CR>


">> Plug Settings for all version
let g:wordmotion_prefix = "<leader>"
let g:wordmotion_mappings = { 'w' : 'w', 'b' : 'b', 'e' : '<W-e>' , 'iw': 'iw'}
" let g:clever_f_chars_math_any_signs = ";"
" let g:clever_f_fix_key_direction = 1

" FIXME bad highlights
" let g:clever_f_mark_direct = 1
" let g:clever_f_chars_match_any_signs = 1


">> Key maps for all
"<< cause i know better
let mapleader = " "
" nnoremap ; zz

" nav remaps
nnoremap die ggVG
nnoremap J }j
nnoremap K {k
nnoremap H B
nnoremap L W
nnoremap } 9k
nnoremap { 9j

" normal maps
nnoremap R r
nnoremap S R
map , %
nnoremap U <C-r>
nnoremap Q @
" nnoremap <silent> <Esc> :noh<CR>

" insert maps
inoremap <C-p> <C-r>0
inoremap <C-l> <Del>

"FIXME suggestions (ctrl + . works) "inoremap <C-space> <C-p>

" visual remaps
vnoremap L W
vnoremap H B
vnoremap > >gv
vnoremap < <gv
vnoremap , %
vnoremap <C-c> "+y

"FIXME vmap <C-/> gcc
vmap s S

" gspot maps
nmap gs ysiw

" Map for r as gr
vmap r gr 
nmap <silent> r :set opfunc=SpecialChange<CR>gr
function! SpecialChange(type)
    silent exec 'gr' 
endfunction

" ctrl maps
"FIXME " noremap <C-S-CR> O<Esc>
nnoremap <CR> o<Esc>
"FIXME " nmap <S-C><CR> O<Esc>
nnoremap <C-s> <Cmd>:w<CR>

" leader maps
nmap <leader>a $
nmap <leader>i ^
vmap <leader>i $
vmap <leader>a ^

nmap <leader>o o<Esc>O
nmap <leader>. @@

nmap <leader>; $a;<Esc>
nmap <leader><leader>; a;<Esc>
nmap <leader>, $a,<Esc>
nmap <leader>p "*p
nmap <leader>m M
nmap <leader>j zb
nmap <leader>k zt
nmap <leader>f zz
nmap <leader>v vaBV
nmap <leader>V vabV

"FIXME nnoremap <leader>K "break line at next space
nnoremap <leader>J J

" Imitate goto symbol clear/insert
nmap <leader>{ f{ci{
nmap <leader>} f}i
nmap <leader>( f(ci(
nmap <leader>) f)i
nmap <leader>[ f[ci[
nmap <leader>] f]i

"TODO better [ ] as g; and g,

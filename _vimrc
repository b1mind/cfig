set nohlsearch
set hidden

if !exists('g:vscode')
  syntax on
  set encoding=UTF-8
  set t_Co=256

  " -- Keep Settings --
  set termguicolors
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
  Plug 'unblevable/quick-scope'

  " neovim plugins only
  if !exists('g:vscode') 

    " visual plugs
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'sainnhe/gruvbox-material'
    Plug 'joshdick/onedark.vim'
    Plug 'ryanoasis/vim-devicons'

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
    Plug 'vuciv/vim-bujo'
    Plug 'tpope/vim-dispatch'
    "  Plug 'theprimeagen/vim-be-good'
  endif

":Plug install, update, help
call plug#end() 

" VIM only settings
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

  " >> For reload on vimrc save
  augroup myvimrc
      au!
      au BufWritePost init.vim,.vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
  augroup END

  " >> Keymappings VIM only
  imap ; <Esc>
  vmap ; <Esc>

  "TODO add terminal hotkey for vim
  "
  "TODO split buffer/panes
  "
  " navigate windows/buffers
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  " mimic vsc binds
  nnoremap <C-w> <Cmd>:q<CR>

  "FIXME " nnoremap <C-r> :replace all defName vsCode
  "FIXME " nnoremap <C-/> gcc

  " leader leader window/plugin actions 
  nnoremap <leader><leader>u :UndotreeShow<CR>
  nnoremap <leader><leader>e :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

endif "end not vsCode settings

">> Plug Settings for all version
let g:wordmotion_prefix = "<leader>"
let g:wordmotion_mappings = { 'w' : 'w', 'b' : 'b', 'e' : '<W-e>' , 'iw': 'iw'}

highlight QuickScopePrimary gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary gui=underline ctermfg=81 cterm=underline
" highlight QuickScopePrimary guifg='#666666' gui=underline ctermfg=155 cterm=underline
" highlight QuickScopeSecondary guifg='#888888' gui=underline ctermfg=81 cterm=underline

">> Key maps for all
"<< cause i know better
let mapleader = " "

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
nnoremap , %
nnoremap U <C-r>
nnoremap Q @

" insert maps
inoremap <C-p> <C-r>0

"FIXME suggestions (ctrl + . works) "inoremap <C-space> <C-p>

" visual remaps
vnoremap L W
vnoremap H B
vnoremap > >gv
vnoremap < <gv
vnoremap , %
vnoremap <C-c> "+y

"FIXME vmap <C-/> gcc
vmap <leader>i $
vmap <leader>a ^
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
nmap <CR> o<Esc>
"FIXME " nmap <S-C><CR> O<Esc>
nnoremap <C-s> <Cmd>:w<CR>

" leader maps
nnoremap <leader>s <Cmd>:w<CR>
nnoremap <leader>q <Cmd>:wq<CR>
nnoremap <leader>o o<Esc>O
nnoremap <leader>i $
nnoremap <leader>a ^

nnoremap <leader>; $a;<Esc>
nnoremap <leader>, $a,<Esc>
nnoremap <leader>p "*p
nnoremap <leader>m M
nnoremap <leader>j zb
nnoremap <leader>k zt
nnoremap <leader>f zz
nnoremap <leader>J J
noremap <leader>v vaBV
noremap <leader>V vabV

"FIXME nnoremap <leader>K "break line at next space

" Imitate goto symbol clear/insert
nnoremap <leader>{ f{ci{
nnoremap <leader>} f}i
nnoremap <leader>( f(ci(
nnoremap <leader>) f)i
nnoremap <leader>[ f[ci[
nnoremap <leader>] f]i

"TODO better [ ] as g; and g,
if exists('g:vscode') " start vs code only settings
  nnoremap <silent> <leader>z <Cmd>call VSCodeCall('workbench.action.toggleZenMode')<CR>
  nnoremap <silent> zv <Cmd>call VSCodeCall('workbench.action.toggleZenMode')<CR>
  nnoremap <silent> <leader>s <Cmd>call VSCodeCall('workbench.action.files.save')<CR>

  "gspot vsc actions (todo make some work for neovim)
  nnoremap <silent> gp <Cmd>call VSCodeCall('editor.action.peekDefinition')<CR>
  nnoremap <silent> gl <Cmd>call VSCodeCall('editor.action.openLink')<CR>
  nnoremap <silent> gv <Cmd>call VSCodeCall('editor.action.dirtydiff.next')<CR>
  noremap <silent> gm <Cmd>call VSCodeCall('editor.action.addSelectionToNextFindMatch')<CR>
  noremap <silent> gM <Cmd>call VSCodeCall('editor.action.selectHighlights')<CR>

  "Good example of cmd bind that extends
  nnoremap <silent> ? <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>

  "TODO "Bookmarks for m1 m2 m3,,, '1 '2 '3

  " Fix for comments?
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine

  "FIXME " Highlighting in vsCode/neoVCS/neovim are all different?
  nnoremap <silent> gC <Cmd>call VSCodeCall('editor.action.blockComment')<CR>
  vmap af <Cmd>call VSCodeCall('editor.action.smartSelect.expand')<CR>
  vmap aF <Cmd>call VSCodeCall('editor.action.smartSelect.shrink')<CR>
  "
  "BORKED
  "(Hacky attempt and having colored action bar but overwrites and esc not working)
  "nnoremap <silent> i <Cmd>call VSCodeCall('settings.cycle.statusBarInsert')<CR>i
  "#nnoremap <silent> v <Cmd>call VSCodeCall('settings.cycle.statusBarVisual')<CR>v
  "#nnoremap <silent> ; <Cmd>call VSCodeCall('settings.cycle.statusBarEsc')<CR><Esc>
  "#nnoremap <silent> ? <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>

endif

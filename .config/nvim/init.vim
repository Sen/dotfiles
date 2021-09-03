set nocompatible              " be iMproved, required
set autoread
au FocusGained * :checktime

filetype off " set the runtime path to include Vundle and initialize

" set rtp+=/usr/local/opt/fzf

call plug#begin('~/.vim/plugged')

" file explorer
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

Plug 'jiangmiao/auto-pairs' " autopair
Plug 'romainl/Apprentice'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf' ", { 'do': { -> fzf#install() } }
Plug 'jremmen/vim-ripgrep'
Plug 'airblade/vim-gitgutter' " git
" Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'haya14busa/incsearch.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'

" run cmd aysnc
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'
Plug 'elixir-lang/vim-elixir'
Plug 'vim-ruby/vim-ruby'
Plug 'kchmck/vim-coffee-script'
Plug 'cakebaker/scss-syntax.vim'
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'jimenezrick/vimerl'
Plug 'lambdatoast/elm.vim'
Plug 'othree/yajs.vim'

Plug 'itchyny/lightline.vim'
Plug 'ntpeters/vim-better-whitespace'

" color
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'

" indent line
" Plug 'Yggdroot/indentLine'

" Plug 'ap/vim-buftabline'

" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'romgrk/barbar.nvim'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()            " required

filetype plugin indent on    " required

set background=dark
colorscheme one
let g:airline_theme='one'
" colorscheme one "onedark
" let g:onedark_termcolors=256
" let g:solarized_termcolors=256

syntax on

" set guifont=Meslo\ LG\ M\ for\ Powerline:h15
" set guifont=Source\ Code\ Pro\ for\ Powerline:h14
" set guifont=Fira\ Mono\ for\ Powerline:h14
" set guifont=Inconsolata-G\ for\ Powerline:h14
set guifont=mononoki:h16

set dir=/tmp
set backspace=indent,eol,start
set number
set t_Co=256
set hlsearch
set nowrap
set re=1
set laststatus=2
set hidden
set wildignore+=*/.git/*,*/tmp/*,*.swp,node_modules/**
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab

" terminal
set notermguicolors
"iterm2, kitty
" set termguicolors

" clean whitespace
autocmd FileType c,cpp,haml,ruby,ru,javascript,coffee,slim autocmd BufWritePre <buffer> :%s/\s\+$//e

" files
autocmd BufRead,BufNewFile *.jbuilder set filetype=Ruby

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-t> <C-w>T
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <C-p> :FZF<cr>

" nvim-tree.lua
let g:nvim_tree_side = 'right'
nnoremap <leader>n :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>m :NvimTreeFindFile<CR>

" nerdtree
" map <Leader>n <plug>NERDTreeTabsToggle<CR>
" let g:nerdtree_tabs_autoclose=1
" let g:NERDTreeWinPos = "right"
" let g:nerdtree_tabs_open_on_gui_startup=0
" let NERDTreeShowHidden=1

" go
autocmd FileType go set tabstop=4|set shiftwidth=4|set expandtab
au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql

" javascript
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

" easy align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
"
" " Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

let g:rehash256 = 1

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ],
      \   'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]],
      \ },
      \ 'colorscheme': 'one',
      \ }

" onedark

" disable python check
let g:loaded_python_provider = 0

vnoremap <leader>g y<Esc>:Rg <C-R>"<CR>
nnoremap <leader>g :Rg 

" buffers
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <S-N> :bnext<CR>
nnoremap <S-P> :bprev<CR>
nnoremap Q :bd<CR>
nnoremap <C-w> :bp<cr>:bd #<cr> " :bd will close all buffers bug
nnoremap <Leader>, :Buffers<CR> " browse buffers
nnoremap <silent> <Leader>b :call fzf#run({
\   'source':  reverse(<sid>list_buffers()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>list_buffers()) + 2
\ })<CR>

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

" delete buffer with multi selection
command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

" reload vim config
nnoremap <leader>sv :source $MYVIMRC<CR>

let g:LanguageClient_serverCommands = {
      \ 'rust': ['rust-analyzer'],
      \ }

nnoremap <Leader>t :!rails test % --backtrace<CR>
" make vertsplit invisible
"let g:equinusocio_material_hide_vertsplit = 1
nnoremap <Leader>f :NERDTreeFind<CR>

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
" Plug '/usr/local/opt/fzf'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
" Plug 'jremmen/vim-ripgrep'
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
Plug 'tomlion/vim-solidity'
Plug 'ray-x/go.nvim'

Plug 'itchyny/lightline.vim'
Plug 'ntpeters/vim-better-whitespace'

" color
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

Plug 'wellle/targets.vim'

" indent line
" Plug 'Yggdroot/indentLine'

" Plug 'ap/vim-buftabline'

" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'romgrk/barbar.nvim'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" github copilot
" Plug 'github/copilot.vim'

" highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" replace fzf
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'neovim/nvim-lspconfig'

call plug#end()            " required

lua require'nvim-tree'.setup()

filetype plugin indent on    " required

set background=dark

" colorscheme one
colorscheme tokyonight
let g:airline_theme='tokyonight'
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
" set notermguicolors
"iterm2, kitty
" set termguicolors
set termguicolors
lua << EOF
require("bufferline").setup{
  options = {
    indicator_style = 'icon',
    separator_style = { '', '' },
    tab_size = 0,
    buffer_close_icon = '',
    modified_icon = '',
    close_icon = '',
  },
  highlights = {
    buffer_selected = {
      italic = false
    },
  },
}
EOF

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

" nmap <C-p> :FZF<cr>

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
      \ 'colorscheme': 'tokyonight',
      \ 'enable': {
      \   'tabline': 0
      \ }
      \ }

" onedark

" disable python check
let g:loaded_python_provider = 0

"vnoremap <leader>g y<Esc>:Rg <C-R>"<CR>
"nnoremap <leader>g :Rg<CR>

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

" browse buffers
"nnoremap <Leader>b :Buffers<CR>
" nnoremap <silent> <Leader>b :call fzf#run({
" \   'source':  reverse(<sid>list_buffers()),
" \   'sink':    function('<sid>bufopen'),
" \   'options': '+m',
" \   'down':    len(<sid>list_buffers()) + 2
" \ })<CR>

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
" nnoremap <Leader>f :NERDTreeFind<CR>

" function! RipgrepFzf(query, fullscreen)
"   let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
"   let initial_command = printf(command_fmt, shellescape(a:query))
"   let reload_command = printf(command_fmt, '{q}')
"   let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
"   call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
" endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end


local keymap = vim.keymap.set
local tb = require('telescope.builtin')
local opts = { noremap = true, silent = true }

-- keymap('n', '<leader>b', ':Telescope current_buffer_fuzzy_find<cr>', opts)
-- keymap('v', '<leader>b', function()
-- 	local text = vim.getVisualSelection()
--	tb.current_buffer_fuzzy_find({ default_text = text })
-- end, opts)

keymap('n', '<leader>g', ':Telescope live_grep<cr>', opts)
keymap('v', '<leader>g', function()
	local text = vim.getVisualSelection()
	tb.live_grep({ default_text = text })
end, opts)

local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
})
EOF

lua << EOF
require'lspconfig'.solargraph.setup{}
EOF

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "solargraph" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
	on_attach = on_attach,
	flags = {
	  debounce_text_changes = 150,
	}
  }
end
EOF

nnoremap <C-S-s> :NvimTreeFindFile<cr>
vmap <C-y> "+y

syntax on
filetype plugin indent on

call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'jiangmiao/auto-pairs'
Plug 'arcticicestudio/nord-vim'
Plug 'pgdouyon/vim-yin-yang'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
call plug#end()

"""""GENERAL VIM REMAPS"""""
let mapleader = " "
tnoremap <Esc> <C-\><C-n>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
cnoremap <expr> <space>  wildmenumode()?"<Down>":"\<space>"
cnoremap W w
cnoremap Q q
nnoremap <Tab> :tabNext<CR>
nnoremap <C-t> :tabnew<CR>
""""""""""""""""""""""""""""
source ~/.config/nvim/terminal.vim

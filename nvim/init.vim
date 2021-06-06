" Authors: Fernando Fernandez (frfernandez)

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } |
			\ Plug 'junegunn/fzf.vim'	
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } |
			\ Plug 'Xuyuanp/nerdtree-git-plugin' |
			\ Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
	
call plug#end()

source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/keys.vim
source $HOME/.config/nvim/line.vim

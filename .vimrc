set nocompatible

"***********************
"vundle
"***********************
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'chun-yang/auto-pairs'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'shougo/neocomplete'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'

call vundle#end()            " required
filetype plugin indent on    " required

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins
" :PluginUpdate     - update plugins
" :PluginSearch foo - searches for foo
" :PluginClean      - confirms removal of unused plugins
"
" see :h vundle for more details


"***********************
"faster split navigation
"***********************
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"***********************
"be legit
"***********************
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

"***********************
"enable <C-s> saving
"***********************
command! -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|end
nnoremap <silent> <C-s> :<C-u>Update<CR>

"***********************
"Leader mappings
"***********************
map <Leader>-   :bp<CR>
map <Leader>=   :bn<CR>
map <Leader>h   :noh<CR>
map <Leader>q   :bp<bar>sp<bar>bn<bar>bd<CR>
map <Leader>rc  :e ~/.vimrc<CR>
map <Leader>rsp :e ~/development/code/scratchpads/ruby_scratchpad.rb<CR>
map <Leader>jsp :e ~/development/code/scratchpads/js-scratchpad.js<CR>


" ***********************
" NERDTree mappings
" ***********************
map <F9> :NERDTreeFind<CR>
map <F10> :NERDTreeToggle<CR>

"***********************
"General settings
"***********************
set encoding=utf-8
set hlsearch      		" highlight matches
set number
set numberwidth=5
set relativenumber
set ruler         		" show the cursor position all the time
set splitbelow
set splitright

"***********************
"Softtabs, 2 spaces
"***********************
set expandtab
set shiftwidth=2
set softtabstop=2 		
set tabstop=2

"***********************
"Color scheme
"***********************
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark " or light
colorscheme solarized
syntax enable

"***********************
"Airline settings
"***********************
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme='solarized'
set t_Co=256
set laststatus=2        " Always display the status line

"***********************
"highlight cursor row
"***********************
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline
set cursorline


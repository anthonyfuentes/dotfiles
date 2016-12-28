
set nocompatible

" vundle
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
Plugin 'shougo/neocomplete.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
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

runtime macros/matchit.vim
set shell=/bin/bash
set ttyfast
set lazyredraw

let $PATH='/usr/local/bin:' . $PATH
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"
" treat <li> and <p> tags like block tags
let g:html_indent_tags = 'li\|p'
let g:jsx_ext_required = 0
let g:neocomplete#enable_at_startup = 1
let g:session_autoload = 'no'
" configure syntastic syntax checking to check on open as well as save
let g:syntastic_ruby_checkers = ['mri']
let g:syntastic_enable_highlighting=0

" leader mappings
map <Leader>-   :bp<CR>
map <Leader>=   :bn<CR>
map <Leader>]   :vertical resize -5<CR>
map <Leader>[   :vertical resize +5<CR>
map <Leader>bk  :e ~/development/study_materials/readings/bookmark.txt<CR>
map <Leader>brc :e ~/.bashrc<CR>
map <Leader>h   :noh<CR>
map <Leader>ob  :Obsess<CR>
map <Leader>q   :bp<bar>sp<bar>bn<bar>bd<CR>
map <Leader>rc  :e ~/.vimrc<CR>
map <Leader>rsp :e ~/development/code/scratchpads/ruby_scratchpad.rb<CR>
map <Leader>jsp :e ~/development/code/scratchpads/js-scratchpad.js<CR>
map <Leader>w   :update<CR>

" other mappings
map q: <Nop>
map <F9> :NERDTreeFind<CR>
map <F10> :NERDTreeToggle<CR>
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
nnoremap Q <nop>
" faster split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" general settings
set autoindent
set autowrite     " Automatically :write before running commands
set backspace=2   " Backspace deletes like most programs in insert mode
set backspace=indent,eol,start
set encoding=utf-8
set foldmethod=manual
set nofoldenable  "dont fold by default
set hidden
set history=500
set hlsearch      " highlight matches
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set list listchars=tab:»·,trail:·
set modelines=0
set nobackup
set noswapfile
set notimeout
set nowritebackup
set relativenumber
set ruler         " show the cursor position all the time
set scrolloff=3
set showcmd       " display incomplete commands
set showmode
set splitbelow
set splitright
set ttimeout
set ttimeoutlen=20
set visualbell
set wildmenu
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
" Numbers
set number
set numberwidth=5
" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

" highlight vertical column of cursor
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline
set cursorline

"key to insert mode with paste using F2 key
" Leave paste mode on exit
au InsertLeave * set nopaste

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme='solarized'
set t_Co=256

:set smartcase
:set ignorecase

" Color scheme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark " or light
colorscheme solarized
syntax enable

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Remove trailing whitespace on save for ruby files.
function! s:RemoveTrailingWhitespaces()
  "Save last cursor position
  let l = line(".")
  let c = col(".")

  %s/\s\+$//ge

  call cursor(l,c)
endfunction

au BufWritePre * :call <SID>RemoveTrailingWhitespaces()

" enable <C-s> saving
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|end
nnoremap <silent> <C-s> :<C-u>Update<CR>


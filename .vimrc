
set nocompatible

" vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'shougo/neocomplete.vim'
Plugin 'scrooloose/nerdcommenter'

call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
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
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
let g:jsx_ext_required = 0
let g:neocomplete#enable_at_startup = 1
let g:ruby_path="~/.rvm/bin/ruby"
let g:session_autoload = 'no'
" configure syntastic syntax checking to check on open as well as save
let g:syntastic_ruby_checkers = ['mri']
let g:syntastic_enable_highlighting=0
" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"
" Quicker window movement. Seemlessly navigate between Vim/Tmux panes
let g:tmux_navigator_no_mappings = 1

:au FocusLost * :wa "Save on focus lost

" Leader Mappings
map <Leader>bk  :e ~/development/readings/bookmark.txt<CR>
map <Leader>brc :e ~/.bashrc<CR>
map <Leader>gc  :Gcommit<CR>
map <Leader>gp  :Gpush<CR>
map <Leader>gs  :Gstatus<CR>
map <Leader>h   :noh<CR>
map <Leader>ls  :ls<CR>
map <Leader>ob  :Obsess<CR>
map <Leader>qa  :qall<CR>
map <Leader>rc  :e ~/.vimrc<CR>
map <Leader>rsp :e ~/development/scratchpads/ruby_scratchpad.rb<CR>
map <Leader>tc  :e ~/.tmux.conf<CR>
map <Leader>w   :update<CR>
map <Leader>-   :bp<CR>
map <Leader>=   :bn<CR>
map <Leader>]   :vertical resize -5<CR>
map <Leader>[   :vertical resize +5<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>t :call RunCurrentSpecFile()<CR>
" key mappings
map <F2> :set paste<CR>i
map <F3> :source ~/development/active.vim<CR>
map <F5> :g/^\s*$/d<CR>
map <F9> :NERDTreeFind<CR>
map <F10> :NERDTreeToggle<CR>
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
" This is a hack due to a neovim bug for going Left
" https://github.com/christoomey/vim-tmux-navigator#it-doesnt-work-in-neovim-specifically-c-h
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
" bind K to search word under cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" general settings
set autoindent
set autowrite     " Automatically :write before running commands
set backspace=2   " Backspace deletes like most programs in insert mode
set backspace=indent,eol,start
set encoding=utf-8
set foldmethod=manual
set hidden
set history=500
set hlsearch      " highlight matches
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set list listchars=tab:»·,trail:·
set modelines=0
set nobackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
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

filetype plugin indent on

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

let g:rspec_command = 'call Send_to_Tmux("NO_RENDERER=true bundle exec rspec {spec}\n")'
" Mocha command is specific to Product Hunt setup. Probably doesn't work with
" other apps
let g:mocha_js_command = 'call Send_to_Tmux("$(npm bin)/mocha --opts spec/javascripts/mocha.opts {spec}\n")'
let g:rspec_runner = "os_x_iterm"

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup
  let g:grep_cmd_opts = '--line-numbers --noheading'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

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

" Create related file (Rails Spec file if missing). :AC
function! s:CreateRelated()
  let related = rails#buffer().alternate_candidates()[0]
  call s:Open(related)
endfunction

function! s:Open(file)
  exec('vsplit ' . a:file)
endfunction

command! AC :call <SID>CreateRelated()

" enable pathogen
execute pathogen#infect()

" enable <C-s> saving
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-s> :<C-u>Update<CR>

"folding settings
set foldmethod=manual   "fold based on selection
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Added
set modelines=0
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set hidden
set wildmenu
set visualbell
set backspace=indent,eol,start
set relativenumber
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
map q: <Nop>
nnoremap Q <nop>

let g:neocomplete#enable_at_startup = 1

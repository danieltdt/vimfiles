set nocompatible              " be iMproved, required
filetype off                  " required

" Using Vundle
"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')

" Using Plug
call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle, required
Plug 'gmarik/Vundle.vim'

" Plugins
" Environment
Plug 'bling/vim-airline'               " better status/tabline
Plug 'scrooloose/nerdtree'             " file finder sidebar
Plug 'nathanaelkane/vim-indent-guides' " visual indent
Plug 'scrooloose/nerdcommenter'        " better commenting
Plug 'tpope/vim-repeat'                " better command repeating with map
Plug 'tpope/vim-surround'              " better 'surrondings'
Plug 'itspriddle/vim-stripper'         " strip trailing whitespace
Plug 'ervandew/supertab'               " completion on insert mode
Plug 'Raimondi/delimitMate'            " delimiter (quotes, parens, etc) completion
Plug 'mattn/emmet-vim'                 " expanding abbreviations
Plug 'ctrlpvim/ctrlp.vim'              " file finder
Plug 'iurifq/ctrlp-rails.vim'          " rails support when finding files
Plug 'JazzCore/ctrlp-cmatcher', { 'do': './install.sh' } " faster ctrlp matcher
let g:airline_powerline_fonts = 1
let g:ctrlp_custom_ignore = '\v[\/](tmp|node_modules|coverage|.log|.git|.hg|.svn|.pyc)$'
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .log
      \ --ignore "**/*.pyc"
      \ --ignore tmp
      \ --ignore node_modules
      \ --ignore coverage
      \ -g ""'

" Snippet engine
if has("python") | Plug 'SirVer/ultisnips'
else             | Plug 'garbas/vim-snipmate'
endif

" Snippets
Plug 'honza/vim-snippets'              " community snippets

" Syntax
Plug 'scrooloose/syntastic'            " syntax checking
let g:syntastic_javascript_checkers = ['eslint', 'jslint']

" Git
Plug 'tpope/vim-fugitive'              " awesome git wrapper
Plug 'gregsexton/gitv'                 " gitk for vim

" Languages
Plug 'vim-ruby/vim-ruby'               " ruby support
Plug 'jelera/vim-javascript-syntax'    " javascript support
Plug 'tpope/vim-haml'                  " haml support
Plug 'tpope/vim-markdown'              " markdown support
Plug 'tpope/vim-cucumber'              " cucumber support
Plug 'lervag/vimtex'                   " LaTeX support
Plug 'evanmiller/nginx-vim-syntax'     " nginx support
au BufRead,BufNewFile *.es6 set filetype=javascript
au BufRead,BufNewFile *nginx/*.conf set filetype=nginx

" Coloschemes
Plug 'altercation/vim-colors-solarized'
Plug 'justincampbell/vim-railscasts'
Plug 'wellsjo/wells-colorscheme.vim'
Plug 'EHartC/Spink'
Plug 'vim-scripts/twilight256.vim'
Plug 'nanotech/jellybeans.vim'

" Dictionaries
Plug 'guileen/vim-node-dict'
au FileType javascript set dictionary+=~/.vim/bundle/vim-node-dict/dict/node.dict

" Others
Plug 'moll/vim-node'                   " node.js tools
Plug 'tpope/vim-rails'                 " rails tools
Plug 'tpope/vim-classpath'             " java classpath support
Plug 'rainerborene/vim-reek'           " ruby code smell detection (requires `reek`)
Plug 'ngmy/vim-rubocop'                " rubocop support
Plug 'wfleming/vim-codeclimate'        " codeclimate support
Plug 'beloglazov/vim-online-thesaurus' " thesaurus online

" All of your Plugins must be added before the following line
" Using Vundle
"call vundle#end()            " required

" Using Plug
call plug#end()              " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" turn on syntax highlighting
syntax on
set background=dark
colorscheme jellybeans
hi NonText ctermbg=none
hi Normal ctermbg=none

set encoding=utf-8

" UI
set ruler                 " Ruler on
set nu                    " Line numbers on
set wrap                  " Line wrapping on
let &showbreak = '↳ '     " Define line break character
set laststatus=2          " Always show the statusline
set showmode              " Alwyas show the active mode
set cmdheight=1           " Make the command area one lines high
set textwidth=80          " Make 80th column visible
set colorcolumn=+1
set showmatch             " Show matching brackets.
set matchtime=2           " How many tenths of a second to blink
set list                  " Show invisible characters
set t_Co=256              " Force 256 colors
set listchars=""          " Reset the listchars
set listchars+=tab:\⇥\    " A tab should display as "⇥ ", trailing whitespace as "."
set listchars+=trail:.    " Show trailing spaces as dots
set listchars+=eol:¬      " Show end-of-line as "¬"
set listchars+=extends:>  " The character to show in the last column when wrap is
                          " off and the line continues beyond the right of the screen
set listchars+=precedes:< " The character to show in the last column when wrap is
                          " off and the line continues beyond the left of the screen

" Behaviors
set complete+=k           " Enable dictonary on completion
set autoread              " Automatically reload changes if detected
set wildmenu              " Turn on Wild menu
set hidden                " Change buffer - without saving
set history=768           " Number of things to remember in history.
set cf                    " Enable error files & error jumping.
set autowrite             " Writes on make/shell commands
set timeoutlen=350        " Time to wait for a command (after leader for example)
set foldmethod=syntax     " Enable folding
set formatoptions=tcrq    " t: autowrap text, c: autowrap comments, r: keep on
                          "   comment after hitting <enter>, q: format comments
set iskeyword+=$,@        " Add extra characters that are valid parts of variables
set pastetoggle=<F2>      " Set F2 as paste mode toggler

" Text Format
set expandtab             " Expand <tab> as spaces
set backspace=2           " Delete everything with backspace
set shiftwidth=2          " Columns indented using >> and << or smart indent
set softtabstop=2         " Number of spaces to count while editing
set smarttab              " Let <tab> and <bs> check shiftwidth or tabstop
set smartindent           " Smart indent like a C-program
set autoindent            " Copy indent from current line when adding a new one

" Searching
set ignorecase            " Case insensitive search
set smartcase             " Override ignorecase if pattern contains upper case chars
set incsearch             " Show matching cases while typing
set hlsearch              " Highligh search results

set wildignore+=.git,.svn
set wildignore+=*.o,*.out,*.obj,*.pyc,*.rbc,*.class,*.jar,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/node_modules/*

" Mappings
" map paste mode (fixes autoident on terminal)
nnoremap <F2> :set invpaste paste?<CR>

" toggle nerdtree
map <C-n> :NERDTreeToggle<CR>

" open finder on rails models dir
nnoremap <s-m> :CtrlPModels<CR>
nnoremap <s-v> :CtrlPViews<CR>
nnoremap <s-c> :CtrlPControllers<CR>
nnoremap <s-s> :CtrlPSpecs<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Tab navigation
nnoremap <tab> :tabnext<cr>
nnoremap <s-tab> :tabprevious<cr>

" key mapping for moving lines up and down
nnoremap <leader>mj :m .+1<cr>==
nnoremap <leader>mk :m .-2<cr>==
inoremap <leader>mj <Esc>:m .+1<CR>==gi
inoremap <leader>mk <Esc>:m .-2<CR>==gi
vnoremap <leader>mj :m '>+1<CR>gv=gv
vnoremap <leader>mk :m '<-2<CR>gv=gv

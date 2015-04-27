set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
" Environment
Plugin 'bling/vim-airline'               " better status/tabline
Plugin 'scrooloose/nerdtree'             " file finder sidebar
Plugin 'nathanaelkane/vim-indent-guides' " visual indent
Plugin 'scrooloose/nerdcommenter'        " better commenting
Plugin 'tpope/vim-repeat'                " better command repeating with map
Plugin 'tpope/vim-surround'              " better 'surrondings'
Plugin 'itspriddle/vim-stripper'         " strip trailing whitespace
Plugin 'ervandew/supertab'               " completion on insert mode
Plugin 'Raimondi/delimitMate'            " delimiter (quotes, parens, etc) completion
Plugin 'mattn/emmet-vim'                 " expanding abbreviations
Plugin 'ctrlpvim/ctrlp.vim'              " file finder
let g:airline_powerline_fonts = 1
let g:ctrlp_custom_ignore = '\v[\/](tmp|node_modules|coverage|.log|.git|.hg|.svn|.pyc)$'

" Snippet engine
if has("python") | Plugin 'SirVer/ultisnips'
else             | Plugin 'garbas/vim-snipmate'
endif

" Snippets
Plugin 'honza/vim-snippets'              " community snippets

" Syntax
Plugin 'scrooloose/syntastic'            " syntax checking

" Git
Plugin 'tpope/vim-fugitive'              " awesome git wrapper
Plugin 'gregsexton/gitv'                 " gitk for vim

" Languages
Plugin 'vim-ruby/vim-ruby'               " ruby support
Plugin 'tpope/vim-haml'                  " haml support
Plugin 'tpope/vim-markdown'              " markdown support
Plugin 'tpope/vim-cucumber'              " cucumber support
Plugin 'lervag/vimtex'                   " LaTeX support

" Coloschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'justincampbell/vim-railscasts'
Plugin 'wellsjo/wells-colorscheme.vim'
Plugin 'EHartC/Spink'
Plugin 'vim-scripts/twilight256.vim'
Plugin 'nanotech/jellybeans.vim'

" Dictionaries
Plugin 'guileen/vim-node-dict'
au FileType javascript set dictionary+=~/.vim/bundle/vim-node-dict/dict/node.dict

" Others
Plugin 'moll/vim-node'                   " node.js tools
Plugin 'tpope/vim-rails'                 " rails tools
Plugin 'tpope/vim-classpath'             " java classpath support
Plugin 'rainerborene/vim-reek'           " ruby code smell detection (requires `reek`)
Plugin 'Shutnik/jshint2.vim'             " a better js lint
Plugin 'ngmy/vim-rubocop'                " rubocop support
autocmd BufWritePre *.rb :RuboCop -a

" All of your Plugins must be added before the following line
call vundle#end()            " required
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
set listchars=tab:\⇥\     " A tab should display as "⇥ ", trailing whitespace as "."
set listchars+=trail:.    " Show trailing spaces as dots
set listchars=eol:¬       " Show end-of-line as "¬"
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

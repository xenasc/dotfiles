syntax enable
set autoread
set hidden

set noerrorbells
set visualbell
set ttyfast

set title
set number
set background=dark
set t_Co=256
set mouse=a
set wrap
set wrapmargin=8
set showmatch
set noshowmode

set linebreak
set showbreak=↪
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

set autoindent
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set laststatus=2
set so=7
set mat=2
set updatetime=300

set backspace=eol,start,indent
set clipboard=unnamed

set history=1000
set nobackup
set noswapfile

set incsearch
set ignorecase
set smartcase
set hlsearch
set nolazyredraw

let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }
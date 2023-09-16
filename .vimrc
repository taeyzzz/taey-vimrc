" general
syntax on
set number                      " Line numbers are good
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set showmode                    " Show current mode down the bottom
set gcr=a:blinkon0              " Disable cursor blink
set visualbell                  " No sounds set autoread                    " Reload files changed outside vim
set hidden                      " Make buffers ack like other editors
set updatetime=500              " Reduce update time for tag refresh
set modifiable                  " Allow buffer content to be changed
set encoding=utf8               " Set encoding
set background=dark
set expandtab                   " Use spaces instead of tabs
set smarttab                    " Be smart when using tabs
set incsearch                   " Find the next match as we type the search
set ignorecase                  " Ignore case when searching
set smartcase                   " When searching try to be smart about cases
set hlsearch                    " Highlight search results
set foldmethod=indent           " Fold based on indent
set foldnestmax=3               " Deepest fold is 3 levels
set nofoldenable                " Don't fold by default
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
set nohlsearch
set smartindent
set nowrap
set noshowmode
set completeopt=menuone,noinsert,noselect
highlight ColorColumn ctermbg=darkgrey guibg=lightgrey
set display=truncate
set autoindent
set shiftround
" Change indent based on file type
autocmd BufRead,BufNewFile *.py set shiftwidth=4 tabstop=4
autocmd BufRead,BufNewFile *.js,*.html,*.scss set shiftwidth=2 tabstop=2
" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
" Turn on filetype plugin
filetype plugin indent on
filetype plugin on

let mapleader = "z"

" Change highlight color when goes to next search result
nnoremap <silent> n n:call HLNext(0.2)<cr>
nnoremap <silent> N N:call HLNext(0.2)<cr>
function! HLNext (blinktime)
  let target_pat='\c\%#'.@/
  let ring=matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction
" Sort lines
function! s:SortLinesOpFunc(...)
    '[,']sort
endfunction
nnoremap <silent> \s :<C-u>set operatorfunc=<SID>SortLinesOpFunc<CR>g@
" Install plugin using VimPlug
call plug#begin('~/.vim/plugged')
" Autocomplete
Plug 'Raimondi/delimitMate'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'Yggdroot/indentline'
" Searching
Plug 'eugen0329/vim-esearch'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
" Utils
Plug 'bronson/vim-trailing-whitespace'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/vim-operator-flashy'
Plug 'kana/vim-operator-user'
Plug 'mhinz/vim-mix-format'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'xolox/vim-misc'
Plug 'yssl/QFEnter'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
" Theme & UI
Plug 'edkolev/tmuxline.vim'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Language
Plug 'elixir-editors/vim-elixir'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()
colorscheme gruvbox
" Airline
set laststatus=1
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_theme='wombat'
" mapkey
imap <C-Space> <C-X><C-O>

" Fzf
" https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf
nnoremap <c-p> :Files<CR>
nnoremap <c-t> :NERDTreeToggle<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>
noremap <leader>/ :Commentary<CR>

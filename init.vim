call plug#begin('~/.local/share/nvim/plugged')

"Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --clangd-completer' }
"Plug 'autozimu/LanguageClient-neovim',{'do': 'UpdateRemotePlugins'}
Plug 'w0rp/ale'
Plug 'rhysd/vim-clang-format'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'easymotion/vim-easymotion'
Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'w0ng/vim-hybrid'
Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'junegunn/seoul256.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set path+=**
let &path.="src/include,/usr/include/llvm,/usr/include/llvm-c,/usr/include/allegro5,/usr/include/SDL2"
set wildmenu
set showcmd

set noswapfile
set nobackup
set nowb

set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif


command MesonBuild ! meson build
command NinjaBuild ! ninja -C build
set foldmethod=indent
set foldnestmax=3
set nofoldenable
"set scrollof=8
if &encoding != 'utf-8'
    set encoding=utf-8
endif

let mapleader = ','
map - <C-w>-
map + <C-w>+
map <M-<> <C-w><
map <M->> <C-w>>
noremap <C-c> "+y
noremap <C-v> "+p
noremap <C-x> "+d
inoremap <C-v> <Esc> "+pa
noremap j h
noremap k j
noremap l k

noremap Z <c-r>
noremap <c-r> <NOP>

syntax on
set background=dark
colo gruvbox

set t_Co=256

set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab

let g:airline_theme='bubblegum'
set nu
set ignorecase
set incsearch
set smartcase
set hlsearch
noremap <F3> : set hlsearch!<CR>
set lazyredraw
set ttimeoutlen=10
set showmatch
set mat=0
set laststatus=2
set nowrap
set history=1000
set backspace=indent,eol,start
set <C-n> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1
let g:SuperTabDefaultCompletionType = '<C-k>'
let g:ycm_confirm_extra_conf = 0
let g:ale_completion_enabled = 1
let g:ale_cpp_clang_executable = 'clang++'
let g:ale_linters = {
            \   'cpp': ['clang'],
            \   'rust': ['analyzer'],
            \}
let g:ale_cpp_clang_options = '-std=c++17 -O0 -Wextra -Wall -Wpedantic'
function! WindowNumber(...) 
        let builder = a:1
        let context = a:2
        call builder.add_section('airline_b','%{tabpagewinnr(tabpagenr()) }')
        return 0
endfunction

autocmd BufReadPost *.rs setlocal filetype=rust

set hidden
"let g:LanguageClient_serverCommands = {
   " \'rust': ['rustup','run','nightly','rls'],
   " \ }

call airline#add_statusline_func('WindowNumber')
call airline#add_inactive_statusline_func('WindowNumber')


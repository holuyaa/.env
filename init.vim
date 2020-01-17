"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug (https://github.com/junegunn/vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set nocompatible
" filetype off                   " required!

call plug#begin('~/.vim/plugged')

Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'

Plug 'majutsushi/tagbar'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'vim-scripts/Mark'
Plug 'will133/vim-dirdiff'
Plug 'antiagainst/cscope-macros.vim'
"Plug 'cscope-quickfix'


"Plug 'editqf'
"Plug 'gilligan/vim-lldb'
"Plug 'rizzatti/funcoo.vim'
"Plug 'rizzatti/dash.vim'
"Plug 'taglist-plus'
"Plug 'taglist.vim'

" original repos on github
Plug 'tpope/vim-fugitive'

" language
Plug 'fatih/vim-go'
call plug#end()

set rtp+=~/.fzf


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype plugin indent on     " required!
set hidden
set title
set ttyfast
set textwidth=100
set colorcolumn=100

" vim 하단에 상태 표시줄 옵션
set laststatus=2
" set statusline=%<%F%h%m%r%h%w%y\ %{strftime(\"%Y/%m/%d-%H:%M\")}%=\ col:%c%V\ ascii:%b\ pos:%o\ lin:%l\,%L\ %P
" set statusline=%h%F%m%r%=[%l:%c(%p%%)]
" set statusline=%-3.3n\ %f\ %r%#Error#%m%#Statusline#\ (%l/%L,\ %v)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]

" 상태바에 현재 편집모드를 출력
set showmode
" display incomplete commands
set showcmd
" Show line number
set number!

set report=0
" show the cursor position all the time
set ruler
set scrolloff=5
set sidescrolloff=5
set selection=exclusive

set history=1000
set undolevels=1000

set hlsearch
set incsearch
set magic
set nowrapscan
set ignorecase
set smartcase
set backspace=indent,eol,start

set ts=2    " tabstop
set sts=2   " softtabstop
set sw=2    " shiftwidth
set expandtab
set smartindent
set autoindent
set copyindent

set cindent
set cinoptions=:0,g0,(0,l1,t0
set startofline

set pastetoggle=<Ins>

" 닫는 괄호")", 브라켓"}"을 입력시 매칭되는 여는 괄호, 브라켓에 잠시 커서가 위치했다가 다시 제자리로 돌아 온다.
set showmatch
" 매칭되는 괄호에 <>도 추가
set matchpairs+=<:>

set whichwrap=h,l,<,>,[,]
set wildchar=<Tab>
set wildmenu
set wildmode=longest:full,full
set wildignore=*.swp,*.bak,*.pyc,*.class

set foldmethod=marker

" VIM man pager related setting
autocmd FileType man set nonumber
autocmd FileType man set mouse=a

"파일 형식에 따른 Syntax Highlighting 기능을 켠다
syntax on
filetype on
filetype plugin on
filetype indent on

autocmd FileType python setlocal ts=2 sw=2 sts=2 et sr

set fileencodings=utf-8,cp949,iso-8859-1,unicode
set termencoding=utf-8
" set termencoding=korea                " Cygwin-specific option
set encoding=utf-8

set autowrite
set nobackup
set noswapfile

set mouse=a mousemodel=popup
silent! colorscheme dracula

" setup for the visual environment
if has('gui_running')
  set mousem=popup
  set go-=T
  set gfn=D2Coding:h13
endif

" VIM man pager related setting
autocmd FileType man set nonumber
autocmd FileType man set mouse=a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Change the mapleader from \ to ,
let mapleader=','
let maplocalleader=','

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

" Ctrl-s : saves
inoremap <C-s> <Esc>:w<CR>a
nnoremap <C-s> :w<CR>

"Buffer
map ,1 :b!1<CR>
map ,2 :b!2<CR>
map ,3 :b!3<CR>
map ,4 :b!4<CR>
map ,5 :b!5<CR>
map ,6 :b!6<CR>
map ,7 :b!7<CR>
map ,8 :b!8<CR>
map ,9 :b!9<CR>
map ,0 :b!10<CR>
map ,w :bw<CR>

" tabs
" (LocalLeader is ",")
" create a new tab
map <LocalLeader>tc :tabnew %<cr>
" close a tab
map <LocalLeader>td :tabclose<cr>
" next tab
map <LocalLeader>tn :tabnext<cr>
" previous tab
map <LocalLeader>tp :tabprev<cr>
" move a tab to a new location
map <LocalLeader>tm :tabmove

" some useful mappings
" Y yanks from cursor to $
"map Y y$
" toggle list mode
"map <LocalLeader>tl :set list!<cr>
" toggle paste mode
"nmap <LocalLeader>pp :set paste!<cr>
" change directory to that of current file
"nmap <LocalLeader>cd :cd%:p:h<cr>
" change local directory to that of current file
"nmap <LocalLeader>lcd :lcd%:p:h<cr>
" save and build
"nmap <LocalLeader>wm :w<cr>:make<cr>
" open all folds
nmap <LocalLeader>fo :%foldopen!<cr>
" close all folds
nmap <LocalLeader>fc :%foldclose!<cr>
" ,tt will toggle taglist on and off"{{{
"nmap <LocalLeader>tt :Tlist<cr>
" When I'm pretty sure that the first suggestion is correct
"map <LocalLeader>r 1z=
" togle wordwrap mode
"map <LocalLeader>ww :set wrap!<cr>"}}}

" F? : generating ctags
"map <F?> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --verbose=yes .<CR>
"map <F?> :!ctags -R --languages=C,C++,Java,Sh,Make --c++=kinds=+p --fields=+iaS --extra=+q --verbose=yes > ctags.log .<CR>

"BufExplorer
nnoremap <silent> <F2> :Buffers<CR>
" WinManager plugin settings
nnoremap <silent> <F3> :NERDTreeToggle<CR>
" taglist plugin settings
"nnoremap <silent> <F4> :Tlist<CR>
"nnoremap <silent> <F4> :TlistToggle<CR>
nnoremap <silent> <F4> :TagbarToggle<CR>
" // The switch of the Source Explorer
"nmap <F5> :SrcExplToggle<CR>

"F6 : folding close
nmap <F6> v]}zf
"F7 : folding open
nmap <F7> zo

"map <F8> <esc>:set columns=80<CR>
map <F8> <esc>:vert res 80<cr>
"F10 column 창 두 개로 분리
"map <F9> <esc>:set columns=160<CR>:vs<CR>=<CR><ESC>
map <A-Up> <esc>:res +1<cr>
map <A-Down> <esc>:res -1<cr>
map <A-Right> <esc>:vert res +1<cr>
map <A-Left> <esc>:vert res -1<cr>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <C-m> <C-w>_

"For insert key
"inoremap <C-l> <Insert>
nnoremap <silent> <F12> <Insert>

"sudo 
cmap w!! w !sudo tee % >/dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin airline 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin cscope_quickfix 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" If you don't want to jump first item after :Cscope command, put a line
" in .vimrc like: 
" let Cscope_JumpError = 0
" If you don't want to use keymap for :Cscope command, put a line in .vimrc
" like: 
" let Cscope_Keymap = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin editqf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:editqf_no_mappings = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

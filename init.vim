"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug (https://github.com/junegunn/vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" call plug#begin('~/.vim/plugged')
call plug#begin(stdpath('data').'/plugged')

Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'

Plug 'majutsushi/tagbar'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

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

" original repos on github
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" language
Plug 'fatih/vim-go'
Plug 'udalov/kotlin-vim'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Use release branch
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

" misc
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-surround'
" Plug 'terryma/vim-multiple-cursors'
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

" tabs
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

" open all folds
nmap <LocalLeader>fo :%foldopen!<cr>
" close all folds
nmap <LocalLeader>fc :%foldclose!<cr>

" Buffers
nnoremap <silent> <F2> :Buffers<CR>
" WinManager plugin settings
nnoremap <silent> <F3> :NERDTreeToggle<CR>
nnoremap <silent> <F4> :TagbarToggle<CR>

" F6 : folding close
nmap <F6> v]}zf
" F7 : folding open
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
" Plugin FZF 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Use preview when FzfFiles runs in fullscreen
command! -nargs=? -bang -complete=dir Files
      \ call fzf#vim#files(<q-args>, <bang>0 ? fzf#vim#with_preview('up:60%') : {}, <bang>0)

nnoremap <silent> fo :Files<CR>
nnoremap <silent> fO :Files!<CR>
nnoremap <silent> fh :History:<CR>
nnoremap <silent> fH :History/<CR>
nnoremap <silent> fb :Buffers<CR>
nnoremap <silent> fm :Marks<CR>
nnoremap <silent> <F1> :Helptags<CR>
noremap <silent> f; :Commands<CR>
nnoremap <silent> fl :BLines<CR>
nnoremap <silent> fs :Snippets<CR>

nnoremap <silent> ft :Tags<CR>
nnoremap <silent> fr :Rg<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin airline 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin editqf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:editqf_no_mappings = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin COC 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }
" Use preset argument to open it
nmap <space>e :CocCommand explorer<CR>
"nmap <space>ed :CocCommand explorer --preset .vim<CR>
nmap <space>ef :CocCommand explorer --preset floating<CR>
"nmap <space>ec :CocCommand explorer --preset cocConfig<CR>
"nmap <space>eb :CocCommand explorer --preset buffer<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

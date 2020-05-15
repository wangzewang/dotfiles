" Xiaowangwang's nvim config

"" Specify a directory for plugins

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo .local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"coc.nvim
autocmd FileType json syntax match Comment +\/\/.\+$+
" if hidden is not set, TextEdit might fail.
set hidden
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=500
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
nmap <C-]> <Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
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

"" wakatime
Plug 'wakatime/vim-wakatime'

"" vim tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
set clipboard+=unnamedplus

"" vim buffer switch
""   add Command+[ shortkey to Iterm2 key binding
""   add Command+] shortkey to Iterm2 key binding
nnoremap (( :bp<CR>
nnoremap )) :bn<CR>


"" nerdTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

map tr :NERDTreeToggle<cr>
let NERDTreeWinPos = 'right'
let NERDTreeWinSize = 36
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*
"let NERDTreeRespectWildIgnore=1
let g:NERDTreeGitStatusWithFlags = 1
set guifont=Hack_Nerd_Font:h11

" open NERDTree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree
" mv curosr to opened buffer
autocmd VimEnter * execute "normal \<C-h>"

"" sync open file with NERDTree
"" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()


"" comment
Plug 'scrooloose/nerdcommenter'
""   add Command+/ shortkey to Iterm2 key binding
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle


"" git
"" TODO: add shortkey for this
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'


"" Color Schema
Plug 'jnurmine/Zenburn'

"" vim airline
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"let g:airline_theme="angr"
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#whitespace#enabled = 0
"
"Plug 'itchyny/lightline.vim'
"set noshowmode
"let g:lightline = {
"      \ 'colorscheme': 'seoul256',
"      \ }

"" indent line
Plug 'Yggdroot/indentLine'


"" tagbar
Plug 'majutsushi/tagbar'
map tb :Tagbar<cr>
"let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_width = 26
let g:tagbar_left= 1

let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }

let g:tagbar_type_go = {
    \ 'ctagstype': 'go',
    \ 'kinds' : [
        \'p:package',
        \'f:function',
        \'v:variables',
        \'t:type',
        \'c:const'
    \]
\}

"" Gist
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'


""
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
nmap <C-p> :Files<CR>
nmap <C-e> :Buffers<CR>
nmap <C-g> :Rg<CR>


"" Code Format
Plug 'google/vim-maktaba'
Plug 'google/vim-selector'
Plug 'google/vim-codefmt'
Plug 'google/vim-codereview'
Plug 'google/vim-jsonnet'
Plug 'google/vim-searchindex'
Plug 'google/vim-glaive'
Plug 'google/vim-syncopate'
augroup autoformat_settings
  autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType c,cpp,proto,java,javascript AutoFormatBuffer clang-format
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType vue AutoFormatBuffer prettier
"  autocmd FileType java AutoFormatBuffer google-java-format
"  autocmd FileType bzl AutoFormatBuffer buildifier
"  autocmd FileType dart AutoFormatBuffer dartfmt
"  autocmd FileType gn AutoFormatBuffer gn
"  autocmd FileType python AutoFormatBuffer yapf
augroup END

"" go syntax
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


Plug 'morhetz/gruvbox'

"" Initialize plugin system
call plug#end()


set nocompatible

let mapleader = "\<Space>"

"" syntax
syntax on

set t_Co=256
"colorscheme
set background=dark
"colorscheme zenburn
colorscheme gruvbox

set number
set cursorline
hi CursorLine   cterm=underline ctermbg=52 ctermfg=NONE
" hi cursorline cterm=bold
set laststatus=2

"" After exiting vim, the content is displayed on the terminal screen
set t_ti= t_te=

"" encodings configure
set fileencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,latin1
set fileformats=unix,dos,mac

set wildmenu " Turn on WiLd menu
set wildmode=list:longest,list:full
set wildignore+=*.pyc,*.pyo,*/.git/*,*/node_modules/*

" set noswapfile
set directory=$HOME/.vim/swapfiles//

"" jump to the last position when reopening a file
if has("autocmd")
     "au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"" make backspace work like most other apps
set backspace=2

autocmd BufEnter * lcd %:p:h

"" set tabstop value and shift width
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set hlsearch
set incsearch
hi IncSearch cterm=NONE ctermfg=NONE ctermbg=darkgrey
hi Search cterm=NONE ctermfg=NONE ctermbg=darkgrey
:nnoremap <leader><CR> :nohlsearch<CR><CR>
:nnoremap <leader><leader> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

"" highlight ExtraWhitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$\| \+\ze\t\+\|\t\+\zs \+/

"" python3 support
let g:python3_host_prog = expand('~/.pyenv/versions/3.7.7/bin/python3.7')
"" python2 support
let g:python_host_prog = expand('~/.pyenv/versions/2.7.16/bin/python2.7')

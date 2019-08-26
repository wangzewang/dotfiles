set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Shougo/unite.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jnurmine/Zenburn'
Plugin 'Yggdroot/indentLine'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'w0rp/ale'
Plugin 'davidhalter/jedi-vim'
Plugin 'fatih/vim-go'
Plugin 'uarun/vim-protobuf'
Plugin 'leafgarland/typescript-vim'
Plugin 'yonchu/accelerated-smooth-scroll'
Plugin 'altercation/vim-colors-solarized'
Plugin 'hdima/python-syntax'
Plugin 'powerline/powerline-fonts'
Plugin 'ervandew/supertab'
Plugin 'valloric/youcompleteme'
Plugin 'luochen1990/rainbow'
Plugin 'vim-syntastic/syntastic'
Plugin 'rizzatti/dash.vim'

"rainbow
let g:rainbow_active = 1

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = "\<Space>"

"" syntax
syntax on

set t_Co=256
colorscheme zenburn

set number
set cursorline
hi cursorline cterm=bold
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
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
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

"" highlight ExtraWhitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$\| \+\ze\t\+\|\t\+\zs \+/

"" complete option
set completeopt=menuone,longest

"" Cold Folding
set foldmethod=indent
set foldlevelstart=100
set foldlevel=99

"" Define custom indentation for filetypes
autocmd FileType javascript :setlocal sw=4 ts=4 sts=4
autocmd FileType less :setlocal sw=2 ts=2 sts=2
autocmd FileType json :setlocal sw=2 ts=2 sts=2
autocmd FileType yaml :setlocal sw=2 ts=2 sts=2

"" unite conf
nnoremap <leader>b :<C-u>Unite buffer<cr>
nnoremap <leader>f :<C-u>Unite -start-insert file<cr>
nnoremap <leader><space> :<C-u>Unite -start-insert file_rec<cr>
nnoremap gf :sp<cr> yaw :<C-u>Unite -start-insert file_rec<cr><C-r>"<ESC>

"" ale conf
map <leader>c :ALEToggle<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_python_flake8_options = "--ignore=E402,E128 --max-line-length=160"
let g:ale_linters = {'go': ['golangci-lint']}

"" indentLine
nnoremap <leader>i :IndentLinesToggle<cr>

"" nerdTree
let NERDTreeWinPos = 'right'
let NERDTreeWinSize = 32
map tr :NERDTreeToggle<cr>
let NERDTreeIgnore = ['.*\.pyc', '.*\.gitignore', '.DS_Store', '__pycache__']

"" tagbar
map tb :Tagbar<cr>
let g:tagbar_ctags_bin = 'ctags'
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

"" airline
let g:airline_theme="luna"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 0

"" jedi
let g:jedi#show_call_signatures = "1"

"" vim-go
let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_def_mode = 'godef'

"" ack
let g:ack_use_dispatch = 1
let g:ackprg = 'ag --vimgrep'
nnoremap <leader>/ * :Ack -w <C-r><C-w><cr>

"" YCM
"let g:ycm_path_to_python_interpreter = '/usr/bin/python'
set runtimepath+=~/.vim/bundle/YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
"let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键, 没有这个会拦截掉tab, 导致其他插件的tab不能用.
"let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |            " 回车即选中当前项
nnoremap <F5> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项
let g:ycm_autoclose_preview_window_after_completion = 1  " 补全后自动关闭preview
"minibufexpl
let g:miniBufExplMapWindowNavVim = 1 "可以用<C-h,j,k,l>切换到上下左右的窗口
let g:miniBufExplMapCTabSwitchBufs = 1 "<C-Tab>,<C-S-Tab>切换
let g:miniBufExplModSelTarget = 1

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


set nocompatible

" 显示当前横竖
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorcolumn cursorline
"set cursorline

" Leader
let mapleader = ","


" 控制
set backspace=2   "退格键正常模式
set nobackup      "不使用备份
set nowritebackup "写备份但关闭vim后自动删除
set noswapfile    "关闭交换文件
set history=1000  "历史记录数
set autoread      "设置当文件被改动时自动载入
set autowrite     "自动写入
set confirm       "在处理未保存或只读文件时，弹出确认消息
set ignorecase    "搜索忽略大小写
set clipboard+=unnamed "享剪贴板


" 字体
"set guifont=Monaco\ 12 "设置字体

" 编码
set encoding=utf-8 "Vim 的内部编码
set termencoding=utf-8 "输出到客户终端（Term）采用的编码类型
set fileencoding=utf-8 "Vim 当前编辑的文件在存储时的编码
set fileencodings=utf-8,gbk,gb2312,default,latin1 "Vim 打开文件时的尝试使用的编码

" 语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn

" 显示
set ruler         "始终显示光标位置
set incsearch     "边检索边显示匹配
set showcmd       "显示输入的命令
set laststatus=2  "显示状态行
set matchtime=1   "匹配括号高亮的时间（单位是十分之一秒）
set showmatch     "高亮显示匹配的括号
set t_Co=256      "支持256色

" Numbers
set number
set numberwidth=5

" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif

" 语法高亮显示
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif
syntax enable

" 格式
set tabstop=4    "tab键对应的空格数
set shiftwidth=4 "自动缩进的距离,也是平移字符的距离
set shiftround   "使用 >> 或 << 时， 依shiftwidth 调整宽度
set expandtab    "TAB替换为空格兼容性好  空格替换为TAB :set noexpandtab
set autoindent   "自动缩进 每行的缩进值与上一行相等
set smartindent  "智能缩进

" 基于标记折叠
set foldmethod=marker
" 启动 vim 时关闭折叠代码
" set nofoldenable

" Make it obvious where 80 characters is
"set textwidth=80
"set colorcolumn=+1

" ctrlp
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"

"vim-fugitive 插件 git信息
set laststatus=2 " Always display the status line
set statusline+=%{fugitive#statusline()} "  Git Hotness

" Search results high light
set hlsearch

set statusline+=%{fugitive#statusline()} "  Git Hotness

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Display extra whitespace
"set list listchars=tab:»·,trail:·

" 加载第三方插件
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Cucumber navigation commands
  autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END



" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>


" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" 快速切换
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=40
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
autocmd vimenter * if !argc() | NERDTree | endif " Automatically open a NERDTree if no files where specified
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " Close vim if the only window left open is a NERDTree
nmap <F5> :NERDTreeToggle<cr>

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>

" nohlsearch shortcut
nmap -hl :nohlsearch<cr>
nmap +hl :set hlsearch<cr>

nnoremap <leader>w :w!<CR>
"nnoremap <leader>f :find<CR>

" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

"去空行
nnoremap <F2> :g/^\s*$/d<CR>

"比较文件
nnoremap <C-F2> :vert diffsplit

"新建标签
map <M-F2> :tabnew<CR>

"列出当前目录文件
map <F3> :tabnew .<CR>

"solarized dark配色
"set background=light
"colorscheme solarized

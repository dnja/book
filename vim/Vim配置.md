## vim
- :version 查看版本，必须是vim8
- 如果是vim7，需要重新安装
- 安装vim

        $ git clone https://github.com/vim/vim.git
        $ cd vim/src
        $ ./configure --enable-pythoninterp=yes
        $ make
        $ make install

- 或则直接

        yum install -y vim*

## 安装vundle

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle

    vim ~/.vimrc.bundles

    filetype off
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " Define bundles via Github repos "
    " 左侧功能目录
    Bundle 'majutsushi/tagbar'
    " 完整路径模糊文件，缓冲区，mru，tag，...查找
    Bundle 'ctrlpvim/ctrlp.vim'
    " 语法检查
    Bundle 'scrooloose/syntastic'
    " Git包装器
    Bundle 'tpope/vim-fugitive'
    " 括号，括号，引号
    Bundle 'tpope/vim-surround'
    " 通用注释
    Bundle 'vim-scripts/tComment'
    " 左侧目录
    Bundle 'scrooloose/nerdtree'
    " 状态行插件
    " Bundle 'Lokaltog/vim-powerline' 过期
    " Bundle 'powerline/powerline' 安装不成功
    Bundle 'vim-airline/vim-airline'
    " 文本过滤和对齐
    Bundle 'godlygeek/tabular'
    " 文本片段
    Bundle 'garbas/vim-snipmate'
    " 颜色插件
    Bundle 'altercation/vim-colors-solarized'
    " 一个键直接跳转到目标
    Bundle 'Lokaltog/vim-easymotion'
    " go插件
    Bundle 'fatih/vim-go'

    vim ~/.vimrc

    if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
    endif

- 打开 vim，输入 :BundleInstall

- vim的配置方案可以自定义，也可以直接使用我的配置方案：
- https://github.com/dnja/vim/blob/master/.vimrc

## mac 终端方案：

## 安装 iTerm2
- 下载 Solarized 并且 Profiles - Colors - Color Presets下拉选择配色方案
- “iTerm2 - Preferences - Profiles - Text ，将 Draw bold text in bright colors 前面的勾去掉. （如果已经去掉了，重新点上在去掉）然后重启 iterm2 看看.

- 这是才是真真让 Solarized 配色方案生效了.”

## 个人觉得zsh不是很好用，不建议使用
- 切换bash
    chsh -s /bin/bash
- 切换zsh
    chsh -s /bin/zsh

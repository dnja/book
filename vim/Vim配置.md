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

- 安装vundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle

    vim ~/.vimrc.bundles

    filetype off
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " Define bundles via Github repos "
    Bundle 'majutsushi/tagbar'
    Bundle 'kien/ctrlp.vim'
    Bundle 'scrooloose/syntastic'
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-surround'
    Bundle 'vim-scripts/tComment'
    Bundle 'scrooloose/nerdtree'
    Bundle 'Lokaltog/vim-powerline'
    Bundle 'godlygeek/tabular'
    Bundle 'msanders/snipmate.vim'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'Lokaltog/vim-easymotion'
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

## 配置~/.vimrc快捷键
***
- 新起一行输入fmt.，然后ctrl+x, ctrl+o，Vim 会弹出补齐提示下拉框，不过并非实时跟随的那种补齐，这个补齐是由gocode提供的。
– 输入一行代码：time.Sleep(time.Second)，执行:GoImports，Vim会自动导入time包。
– 将光标移到Sleep函数上，执行:GoDef或命令模式下敲入gd，Vim会打开$GOROOT/src/time/sleep.go中 的Sleep函数的定义。执行:b 1返回到hellogolang.go。
– 执行:GoLint，运行golint在当前Go源文件上。
– 执行:GoDoc，打开当前光标对应符号的Go文档。
– 执行:GoVet，在当前目录下运行go vet在当前Go源文件上。
– 执行:GoRun，编译运行当前main package。
– 执行:GoBuild，编译当前包，这取决于你的源文件，GoBuild不产生结果文件。
– 执行:GoInstall，安装当前包。
– 执行:GoTest，测试你当前路径下地_test.go文件。
– 执行:GoCoverage，创建一个测试覆盖结果文件，并打开浏览器展示当前包的情况。
– 执行:GoErrCheck，检查当前包种可能的未捕获的errors。
– 执行:GoFiles，显示当前包对应的源文件列表。
– 执行:GoDeps，显示当前包的依赖包列表。
– 执行:GoImplements，显示当前类型实现的interface列表。
– 执行:GoRename [to]，将当前光标下的符号替换为[to]。

## 配置~/.vimrc快捷键
***
$ vi ~/.vimrc
" set mapleader
let mapleader = ","

" vim-go custom mappings
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

" vim-go settings
let g:go_fmt_command = "goimports"

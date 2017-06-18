Vundle：https://github.com/VundleVim/Vundle.vim
实现一个vimrc走天下
需要先配置好ctags和cscope
### 安装
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
### 配置文件
https://github.com/VundleVim/Vundle.vim
###  自己的配置
https://github.com/csyanbin/myvim
### YCM

https://github.com/Valloric/YouCompleteMe
git clone https://github.com/Valloric/YouCompleteMe.git
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
~/.vimrc加入配置行 let g:ycm_python_binary_path = 'python'
----------------------------------------------------------------------------------
参考博客http://blog.csdn.net/bokee/article/details/6633193，搭建了自己使用的vim IDE
后续考虑学习使用Vundle进行优化配置

## 总结(迁移和使用流程)
ctags：源码安装，mac遇到问题修改环境变量；需要生成ctags文件,settags=
taglist：插件
cscope：源码安装(yum install ncurses-devel)，插件，加载配置:cs add path/xxx.out
OmniCppComplete：插件
supertab：插件
NERDTree  Winmanager  MiniBufExplorer：插件，解决新开窗口的问题
**迁移的流程**：源码拷走，~/.vim 文件夹拷走，~/.vimrc 拷走
**使用流程：**
   1.生成tags                  ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .   
   ctrl+], ctrl+t
   2.生成cscope文件      cscope -Rbq -f path/xxx.out
   :cs add path/xxx.out
   :cs help   ctrl+shift+-   s,c,d,i,f
   3.打开窗口之后 w-m即可加载全部窗口，包括minibuf，nerd，taglist等
   

## 标签跳转插件
### vim config
vim --version
可以查看系统，用户配置，exrc是兼容vi的
vim  :set rtp 查看vim的插件安装位置runtimepath
### 安装Ctags(支持c++，python等)
Ctags工具是用来遍历源代码文件生成tags文件
tags文件就是Taglist和OmniCppComplete工作的基础。
下载http://ctags.sourceforge.net/ 源码安装，如果mac遇到问题，则注意环境变量/usr/local/bin/ctags
**ctags源码安装centos遇到了segment fault，然而centos自带的ctags运行正常**
```
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .     生成ctags文件
运行vim的时候，必须在“tags”文件所在的目录下运行。否则，运行vim的时候还要用“:settags=”命令设定“tags”文件的路径
ctrl+], ctrl+t 定义变量、函数等跨文件跳转
配合*和#，可以做到大部分情况下的跳转
```
### 安装Taglist
Taglist是vim的一个插件，提供源代码符号的结构化视图。
http://vim-taglist.sourceforge.net/index.html
```
:TlistToggle 启动Taglist功能
vimrc快捷设置
"设置ctags路径
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"启动vim后自动打开taglist窗口
"let Tlist_Auto_Open = 1
"设置taglist打开关闭的快捷键F8
noremap <F8> :TlistToggle<CR>
"更新ctags标签文件快捷键设置
noremap <F6> :!ctags -R<CR
```
### 使用Cscope
Cscope提供交互式查询语言符号功能，如查询哪些地方使用某个变量或调用某个函数。
vim 默认支持，如果不支持可以自己下载 http://cscope.sourceforge.net/
**centos 安装cscope-15.8b遇到build.c:52:20: error: curses.h: No such file or directory，需要先下载安装yum install ncurses-devel**
vim --version 之后 如果有+cscope则说明支持此功能
下载cscope文件，将文件http://cscope.sourceforge.net/cscope_maps.vim下载到~/.vim/plugin目录。
```
cscope -Rbq -f path/xxx.out   生成cscope文件
:cs add path/xxx.out        使用的时候打开vim，加载cscope
:cs help    快捷显示帮助
:help cscope     完整帮助
:cs find s/g/c  name     查找某符号的位置或者是某函数的调用被调用关系

set cscopequickfix=s-,c-,d-,i-,t-,e-        便于显示，修改.vimrc
加入下面的vimrc配置，每次只要在光标对应的单词处输入 ctrl shift -，然后快速 s ， 即对应:cs find s
:cw查看所有的标签
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
```
### OmniCppComplete 补全
下载插件包  http://www.vim.org/scripts/script.php?script_id=1520
拷贝到 ~/.vim 路径
配置~/.vimrc
```
set nocp
filetype plugin on
```
### Super tab
http://www.vim.org/scripts/script.php?script_id=1643
打开下载的vba或者vmb文件
在Vim命令行下运行命令“UseVimball ~/.vim” 将会自解压
vimrc 配置:
```
set g:SuperTabDefaultCompletionType="context" 
```
## 文件和布局插件
NERDTree提供树形浏览文件系统的界面，MiniBufExplorer提供多文件同时编辑功能，而Winmanager将这NERDTree界面和Taglist界面整合起来，使Vim更像VS！
下载路径：
            
			http://www.vim.org/scripts/script.php?script_id=1658
            
			http://www.vim.org/scripts/script.php?script_id=159
			
			http://www.vim.org/scripts/script.php?script_id=1643
UseVimball ~/.vim

vimrc配置
minibuf:
```
let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0 
```
winmanager控制nerdtree和taglist合并
```
let g:NERDTree_title="[NERDTree]"  
let g:winManagerWindowLayout="NERDTree|TagList"  

function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction  

function! NERDTree_IsValid()  
    return 1  
endfunction  

nmap wm :WMToggle<CR> 
```
***解决wm之后出现一个空窗口的bug***
打开plugin/winmanager.vim，找到对应位置加入：exe 'q'
```
function! <SID>ToggleWindowsManager()  
   if IsWinManagerVisible()  
      call s:CloseWindowsManager()  
   else  
      call s:StartWindowsManager()  
      exe 'q'  
   end  
endfunction 
```

### 自动锁进/智能搜索

```
set ignorecase smartcase
set autoindent  
set tabstop=4  
set shiftwidth=4  
p; set mouse=a 
```


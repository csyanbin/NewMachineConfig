" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup
syntax on
set nu!

" 缩进 智能搜索
set ignorecase smartcase
set autoindent  
set tabstop=4  
set shiftwidth=4  
set mouse=a 

" 自定义 ctags TagList TlistToggle cscope等配置
" <<快捷生成ctags文件 ctrl+F12>>
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> 

" <<Tlist 配置>>
"启动vim后自动打开taglist窗口
"let Tlist_Auto_Open = 1
"设置taglist打开关闭的快捷键F8
noremap <F8> :TlistToggle<CR>
"更新ctags标签文件快捷键设置
noremap <F6> :!ctags -R<CR>
"不同时显示多个文件的tag，仅显示一个
let Tlist_Show_One_File=1
"taglist为最后一个窗口时，退出vim
let Tlist_Exit_OnlyWindow=1

" <<cscope 窗口设置>>
set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" <<OmniCppComplete>>
set nocp 
filetype plugin on  

" <<SuperTab>>
let g:SuperTabDefaultCompletionType="context"  

" <<miniBufExplorer>>
let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0  

" <<Nerd Tree>>
let g:NERDTree_title="[NERDTree]"  
let g:winManagerWindowLayout="NERDTree|TagList"  
  
function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction  
  
function! NERDTree_IsValid()  
    return 1  
endfunction  
  
nmap wm :WMToggle<CR> 
"nmap <silent> mt :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR>

" <<windowManager>>
" 解决每次wm出现一个空的窗口的问题,打开plugin/winmanager.vim
" toggle showing the explorer plugins.
"function! <SID>ToggleWindowsManager()
"        if IsWinManagerVisible()
"                call s:CloseWindowsManager()
"        else
"                call s:StartWindowsManager()
"	"解决空白窗口问题
"                exe 'q'
"        end
"endfunction

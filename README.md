## 0. .local folder
mkdir ~/.local
mkdir ~/.local/lib
mkdir ~/.local/bin
mkdir ~/.local/src
# move to data directory and create a soft link back

## 1. SSH
```
ssh-keygen # -t rsa -f file -b 1024   
#copy local machine ~/.ssh/id_rsa.pub to new machine ~/.ssh/authorized_key   
#chmod 644 to ~/.ssh/authorized_key ## if encounters problem   
```

## 2. ZSH   
#### With sudo   
```
sudo apt-get install zsh
chsh -s \`which zsh\`   
```
#### Without sudo 
**ncurses (if necessary)**   
```
wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.1.tar.gz   
tar -zxvf ncurses-6.1.tar.gz   
export CXXFLAGS=" -fPIC"   
export CFLAGS=" -fPIC"   
cd ncurses-6.1   
./configure --enable-shared --prefix=/home/yanbin/.local   
make & make install   
#ADD INCLUDE PATH to SYSTEM header file search path   
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/home/yanbin/.local/include   
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/home/yanbin/.local/include   
```   
**zsh from source (if necessary)**
```
# download zsh source: https://zsh.sourceforge.io/Arc/source.html
wget https://sourceforge.net/projects/zsh/files/zsh/5.9/zsh-5.9.tar.xz/download
tar xf zsh-5.8.tar.xz
export CPPFLAGS="-I/home/yanbin/.local/include" LDFLAGS="-L/home/yanbin/.local/lib"   
./configure --prefix=/home/yanbin/.local --enable-shared   
make & make install  
```
**Oh-My-ZSH**
```
export PATH="$HOME/.local/bin:$PATH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"   
# change default zsh theme to ==> ZSH_THEME="ys"
export SHELL=$HOME/bin/zsh   
exec $HOME/bin/zsh -l   
```
## 3. CMAKE   
```
wget https://cmake.org/files/v3.11/cmake-3.11.0-rc1.tar.gz   
tar xvf cmake-3.11.0-rc1.tar.gz   
cd cmake-3.11.0-rc1   
./configure --prefix=/home/yanbin/.local   
make && make install
```

## 4. HTOP
```
wget https://hisham.hm/htop/releases/2.1.0/htop-2.1.0.tar.gz   
tar xvf htop-2.1.0.tar.gz   
cd htop-2.1.0   
./configure --prefix=/home/yanbin/.local --disable-unicode   
make && make install
```

## 5. VIM
#### (optional) Manually install vim (+python3 support)
```
git clone https://github.com/vim/vim.git
cd vim/src
./configure --with-features=huge --enable-python3interp --with-python3-command=python3 --with-python3-config-dir=$(python3-config --configdir) --enable-multibyte --enable-rubyinterp --disable-nls --enable-cscope --enable-rubyinterp --with-tlib=ncurses --prefix=/data/yanbliu/.local 
make -j 8
make install
```
#### Bundle
```
# check version and python support
vim --version	
# install bundle to manage plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# DefaultConfig, MyCongfig
https://github.com/VundleVim/Vundle.vim
https://github.com/csyanbin/myvim
```
#### YCM install (deprecated, use tabnine instead)
```
cd ~/.vim/bundle
git clone https://github.com/Valloric/YouCompleteMe.git   
cd ~/.vim/bundle/YouCompleteMe   
git submodule update --init --recursive
./install.py --clang-completer
```
#### ctags
```
wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
tar xvf ctags-5.8.tar.gz && cd ctags-5.8
./configure --prefix=/home/yanbin/.local
make && make install
```
#### path
```
export PATH="/home/yanbin/.local/bin:$PATH"
" Go to for '~/.vim/bundle/vim-indent-guides/autoload' folder
" Put 'highlight Normal ctermbg=NONE' in the first line of indent_guides.vim
## If path in ~/.bash_profile not working, directly add export sentence to ~/.zshrc file
```

## 6. Conda
```
wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
sh Anaconda3-2019.10-Linux-x86_64.sh
## TF1
conda create -n TF1 ## if python3.7 not supported add "python=3.6.8"
conda activate TF1
conda install cudatoolkit=10.0
pip install tensorflow-gpu==1.14
## Download cudnn7.4 and put into ~/.local/lib/cuda10-cudnn7.4/lib64
function tf_cudnn(){
    echo "Initialize tf1.14 cudnn7.4 environment"
    export LD_LIBRARY_PATH="~/.local/lib/cuda10-cudnn7.4/lib64:$PATH"
}
## add tf_cudnn() into ~/.zshrc and run tf_cudnn to set LD_LIBRARY_PATH
pip install torch torchvision  ## use cuda10 and cudnn7.4 ?? maybe
```
## Others (tmux)
```
vim ~/.tmux.conf
set -g mouse on
```

## Solve Blue LS text in Dark background
```
## copy this into ~/.bash_profile
#LS_COLORS=$LS_COLORS:'di=0;36' ; export LS_COLORS
LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.bat=01;31:*.reg=01;31:*.app=01;31:*.txt=32:*.org=32:*.md=32:*.mkd=32:*.h=32:*.c=32:*.C=32:*.cc=32:*.cpp=32:*.cxx=32:*.objc=32:*.sh=32:*.csh=32:*.zsh=32:*.el=32:*.vim=32:*.java=32:*.pl=32:*.pm=32:*.py=32:*.rb=32:*.hs=32:*.php=32:*.htm=32:*.html=32:*.shtml=32:*.erb=32:*.haml=32:*.xml=32:*.rdf=32:*.css=32:*.sass=32:*.scss=32:*.less=32:*.js=32:*.coffee=32:*.man=32:*.0=32:*.1=32:*.2=32:*.3=32:*.4=32:*.5=32:*.6=32:*.7=32:*.8=32:*.9=32:*.l=32:*.n=32:*.p=32:*.pod=32:*.tex=32:*.go=32:*.bmp=33:*.cgm=33:*.dl=33:*.dvi=33:*.emf=33:*.eps=33:*.gif=33:*.jpeg=33:*.jpg=33:*.JPG=33:*.mng=33:*.pbm=33:*.pcx=33:*.pdf=33:*.pgm=33:*.png=33:*.PNG=33:*.ppm=33:*.pps=33:*.ppsx=33:*.ps=33:*.svg=33:*.svgz=33:*.tga=33:*.tif=33:*.tiff=33:*.xbm=33:*.xcf=33:*.xpm=33:*.xwd=33:*.xwd=33:*.yuv=33:*.aac=33:*.au=33:*.flac=33:*.m4a=33:*.mid=33:*.midi=33:*.mka=33:*.mp3=33:*.mpa=33:*.mpeg=33:*.mpg=33:*.ogg=33:*.ra=33:*.wav=33:*.anx=33:*.asf=33:*.avi=33:*.axv=33:*.flc=33:*.fli=33:*.flv=33:*.gl=33:*.m2v=33:*.m4v=33:*.mkv=33:*.mov=33:*.MOV=33:*.mp4=33:*.mp4v=33:*.mpeg=33:*.mpg=33:*.nuv=33:*.ogm=33:*.ogv=33:*.ogx=33:*.qt=33:*.rm=33:*.rmvb=33:*.swf=33:*.vob=33:*.webm=33:*.wmv=33:*.doc=31:*.docx=31:*.rtf=31:*.dot=31:*.dotx=31:*.xls=31:*.xlsx=31:*.ppt=31:*.pptx=31:*.fla=31:*.psd=31:*.7z=1;35:*.apk=1;35:*.arj=1;35:*.bin=1;35:*.bz=1;35:*.bz2=1;35:*.cab=1;35:*.deb=1;35:*.dmg=1;35:*.gem=1;35:*.gz=1;35:*.iso=1;35:*.jar=1;35:*.msi=1;35:*.rar=1;35:*.rpm=1;35:*.tar=1;35:*.tbz=1;35:*.tbz2=1;35:*.tgz=1;35:*.tx=1;35:*.war=1;35:*.xpi=1;35:*.xz=1;35:*.z=1;35:*.Z=1;35:*.zip=1;35:*.ANSI-30-black=30:*.ANSI-01;30-brblack=01;30:*.ANSI-31-red=31:*.ANSI-01;31-brred=01;31:*.ANSI-32-green=32:*.ANSI-01;32-brgreen=01;32:*.ANSI-33-yellow=33:*.ANSI-01;33-bryellow=01;33:*.ANSI-34-blue=34:*.ANSI-01;34-brblue=01;34:*.ANSI-35-magenta=35:*.ANSI-01;35-brmagenta=01;35:*.ANSI-36-cyan=36:*.ANSI-01;36-brcyan=01;36:*.ANSI-37-white=37:*.ANSI-01;37-brwhite=01;37:*.log=01;32:*~=01;32:*#=01;32:*.bak=01;33:*.BAK=01;33:*.old=01;33:*.OLD=01;33:*.org_archive=01;33:*.off=01;33:*.OFF=01;33:*.dist=01;33:*.DIST=01;33:*.orig=01;33:*.ORIG=01;33:*.swp=01;33:*.swo=01;33:*,v=01;33:*.gpg=34:*.gpg=34:*.pgp=34:*.asc=34:*.3des=34:*.aes=34:*.enc=34:*.sqlite=34:'
export LS_COLORS
PS1='[\033[1;36m]\u[\033[1;31m]@[\033[1;32m]\h:[\033[1;35m]\w[\033[1;31m]$[\033[0m] '
# PS1='\e[37;1m\u@\e[35m\W\e[0m\$ ' # this will change your prompt format
```	







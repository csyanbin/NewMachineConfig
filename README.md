## 1. SSH   
ssh-keygen -t rsa -f file -b 1024   
copy local machine ~/.ssh/id_rsa.pub to new machine ~/.ssh/authorized_key   
chmod 644 to ~/.ssh/authorized_key if encounters problem   

## 2. zsh (if no sudo)   
sudo apt-get install zsh   
chsh -s \`which zsh\`   
在没有sudo权限的情况下安装zsh全套   
### ncurses:   
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
   
### zsh:
    # download zsh source: https://ftp.osuosl.org/pub/blfs/conglomeration/zsh/
    export CPPFLAGS="-I/home/yanbin/.local/include" LDFLAGS="-L/home/yanbin/.local/lib"   
    ./configure --prefix=/home/yanbin/.local --enable-shared   
    make & make install   
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"   
    #add to default shell and exec while login   
    export SHELL=$HOME/bin/zsh   
    exec $HOME/bin/zsh -l   
## 3. cmake
    wget https://cmake.org/files/v3.11/cmake-3.11.0-rc1.tar.gz   
    tar xvf cmake-3.11.0-rc1.tar.gz   
    cd cmake-3.11.0-rc1   
    ./configure --prefix=/home/yanbin/.local   
    make && make install
    
## 4. htop
    wget https://hisham.hm/htop/releases/2.1.0/htop-2.1.0.tar.gz   
    tar xvf htop-2.1.0.tar.gz   
    cd htop-2.1.0   
    ./configure --prefix=/home/yanbin/.local --disable-unicode   
    make && make install
    
## 5. vim
    #check version and python support
    vim --version	
    #install bundle to manage plugins
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    #Config
    https://github.com/VundleVim/Vundle.vim
    #MyCongfig
    https://github.com/csyanbin/myvim
    #YCM install in case of problem
    cd ~/.vim/bundle
    git clone https://github.com/Valloric/YouCompleteMe.git   
    cd ~/.vim/bundle/YouCompleteMe   
    git submodule update --init --recursive
    ./install.py --clang-completer
    #install ctags if not
    wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
    tar xvf ctags-5.8.tar.gz && cd ctags-5.8
    ./configure --prefix=/home/yanbin/.local
    make && make install
    export PATH="/home/yanbin/.local/bin:$PATH"
    " Go to for '~/.vim/bundle/vim-indent-guides/autoload' folder
    " Put 'highlight Normal ctermbg=NONE' in the first line
    
    ## If path in ~/.bash_profile not working, directly add export sentence to ~/.zshrc file
4. check python path, pip2 or pip3
    cuda version
	







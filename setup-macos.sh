#!/bin/bash

echo '    __               _       ____ ______   ______               '
echo '   / /_  ____  _____(_)_  __/ __ <  /__ \ / ____/               '
echo '  / __ \/ __ \/ ___/ / / / / / / / /__/ //___ \                 '
echo ' / / / / /_/ / /  / / /_/ / /_/ / // __/____/ /                 '
echo '/_/ /_/\____/_/  /_/\__, /\____/_//____/_____/                  '
echo '       __      __  /____/__                       __            '
echo '  ____/ /___  / /_/ __(_) /__  _____   ________  / /___  ______ '
echo ' / __  / __ \/ __/ /_/ / / _ \/ ___/  / ___/ _ \/ __/ / / / __ \'
echo '/ /_/ / /_/ / /_/ __/ / /  __(__  )  (__  )  __/ /_/ /_/ / /_/ /'
echo '\__,_/\____/\__/_/ /_/_/\___/____/  /____/\___/\__/\__,_/ .___/ '
echo '                                                       /_/      '

echo ''
echo '----------------------------------------------------------------'
echo ''

echo 'start setup? [Y/n]'
read ANSWER
case $ANSWER in
  "" | "Y" | "y" )
    continue;;
  * ) exit;;
esac

echo ''
cd ~/

if [ -d ./workspace ]; then
  echo 'skip creating workspace dir'
else
  mkdir workspace
  echo 'workspace dir created'
fi

cd workspace

if [ -d ./dotfiles ]; then
  echo 'skip cloning dotfiles'
else
  git clone https://github.com/horiy0125/dotfiles.git
  echo 'dotfiles cloned'
fi

cd dotfiles

if [ -f ~/.gitconfig ]; then
  echo 'skip copying .gitconfig'
else
  cp ./git/gitconfig ~/.gitconfig
  echo 'copied .gitconfig'
fi

echo '----------------------------------------------------------------'

echo 'install homebrew? [Y/n]'
read ANSWER
case $ANSWER in
  "" | "Y" | "y" )
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo 'installed homebrew';;
  * ) echo 'skip installing homebrew';;
esac

echo '----------------------------------------------------------------'

echo 'install postgres? [Y/n]'
read ANSWER
case $ANSWER in
  "" | "Y" | "y" )
    brew install postgresql
    echo '' >> ~/.zshrc
    echo '# postgres' >> ~/.zshrc
    echo 'export PGDATA=/usr/local/var/postgres' >> ~/.zshrc

    echo 'installed postgres';;
  * ) echo 'skip installing postgres';;
esac

echo '----------------------------------------------------------------'

echo 'install nodenv? [Y/n]'
read ANSWER
case $ANSWER in
  "" | "Y" | "y" )
    git clone https://github.com/nodenv/nodenv.git ~/.nodenv
    echo '' >> ~/.zshrc
    echo '# nodenv' >> ~/.zshrc
    echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(nodenv init -)"' >> ~/.zshrc

    git clone https://github.com/nodenv/node-build.git
    sudo PREFIX=/usr/local ./node-build/install.sh
    rm -rf ./node-build

    source ~/.zshrc

    echo 'installed nodenv';;
  * ) echo 'skip installing nodenv';;
esac

echo '----------------------------------------------------------------'

echo 'install pyenv? [Y/n]'
read ANSWER
case $ANSWER in
  "" | "Y" | "y" )
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    echo '' >> ~/.zprofile
    echo '# pyenv' >> ~/.zprofile
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zprofile
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zprofile
    echo 'eval "$(pyenv init --path)"' >> ~/.zprofile

    echo '' >> ~/.zshrc
    echo '# pyenv' >> ~/.zshrc
    echo 'eval "$(pyenv init -)"' >> ~/.zshrc
    source ~/.zshrc
    source ~/.zprofile

    echo 'installed pyenv';;
  * ) echo 'skip installing pyenv';;
esac

echo '----------------------------------------------------------------'

echo 'install python libraries via pip3? [Y/n]'
read ANSWER
case $ANSWER in
  "" | "Y" | "y" )
    python3 -m pip install --upgrade pip
    pip3 install -r ./pip3/requirements.txt

    echo 'installed python libraries';;
  * ) echo 'skip installing python libraries';;
esac

echo '----------------------------------------------------------------'

echo 'install rbenv? [Y/n]'
read ANSWER
case $ANSWER in
  "" | "Y" | "y" )
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    echo '' >> ~/.zshrc
    echo '# rbenv' >> ~/.zshrc
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc

    git clone https://github.com/rbenv/ruby-build.git
    sudo $ PREFIX=/usr/local ./ruby-build/install.sh
    rm -rf ./ruby-build

    source ~/.zshrc

    echo 'installed rbenv';;
  * ) echo 'skip installing rbenv';;
esac

echo '----------------------------------------------------------------'

echo 'install goenv? [Y/n]'
read ANSWER
case $ANSWER in
  "" | "Y" | "y" )
    git clone https://github.com/syndbg/goenv.git ~/.goenv
    echo '' >> ~/.zshenv
    echo '# goenv' >> ~/.zshenv
    echo 'export GOENV_ROOT="$HOME/.goenv"' >> ~/.zshenv
    echo 'export PATH="$GOENV_ROOT/bin:$PATH"' >> ~/.zshenv
    echo 'eval "$(goenv init -)"' >> ~/.zshenv

    source ~/.zshenv

    echo 'installed goenv';;
  * ) echo 'skip installing goenv';;
esac

echo '----------------------------------------------------------------'

echo 'install vscode extensions? [Y/n]'
read ANSWER
case $ANSWER in
  "" | "Y" | "y" )
    sh ./vscode/install-extensions-for-macos.sh

    echo 'installed vscode extensions';;
  * ) echo 'skip installing vscode extensions';;
esac

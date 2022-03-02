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


echo 'Do you want to start setup? [Y/n]'
read ANSWER
case $ANSWER in
  "" | "Y" | "y" )
    continue;;
  * ) exit;;
esac

echo ''
cd ~/

sudo apt-get update
sudo apt-get upgrade

echo '----------------------------------------------------------------'

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

echo ''
read ANSWER
case $ANSWER in
  "" | "Y" | "y" )
    ;;
  * ) ;;
esac

echo '----------------------------------------------------------------'

echo 'Do you want to install vscode extensions? [Y/n]'
read ANSWER
case $ANSWER in
  "" | "Y" | "y" )
    sh ./vscode/install-extensions.sh

    echo 'installed vscode extensions';;
  * ) echo 'skip installing vscode extensions';;
esac

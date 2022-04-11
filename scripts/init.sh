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
echo ''

cd ~/

echo ''
echo '=== 1. ~/workspace ディレクトリの作成 ==='
echo ''

if [ -d ./workspace ]; then
  echo 'workspace ディレクトリが既に存在するため、作成をスキップしました'
else
  mkdir workspace
  echo 'workspace ディレクトリを作成しました'
fi

echo ''
echo '=== END 1. ~/workspace ディレクトリの作成 ==='
echo ''

cd workspace

echo ''
echo '=== 2. dotfiles リポジトリのクローン ==='
echo ''

if [ -d ./dotfiles ]; then
  echo 'dotfiles リポジトリが既に存在するため、クローンをスキップしました'
else
  git clone https://github.com/horiy0125/dotfiles.git
  echo 'dotfiles リポジトリのクローンが完了しました'
fi

echo ''
echo '=== END 2. dotfiles リポジトリのクローン ==='
echo ''

echo ''
echo '=== 3. ~/.gitconfig の作成　==='
echo ''

cd dotfiles

if [ -f ~/.gitconfig ]; then
  echo '.gitconfig が既に存在するため、作成をスキップしました'
else
  cp ./git/gitconfig ~/.gitconfig
  echo '.gitconfig の作成が完了しました'
fi

echo ''
echo '=== END 3. ~/.gitconfig の作成　==='
echo ''
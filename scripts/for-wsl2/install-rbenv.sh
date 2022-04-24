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
echo '=== 1. rbenv のインストール ==='
echo ''

git clone https://github.com/rbenv/rbenv.git ~/.rbenv

echo ''
echo '=== 1. END rbenv のインストール ==='
echo ''

echo ''
echo '=== 2. ruby-build のインストール ==='
echo ''

git clone https://github.com/rbenv/ruby-build.git
sudo PREFIX=/usr/local ./ruby-build/install.sh
rm -rf ./ruby-build

echo ''
echo '=== 2. END ruby-build のインストール ==='
echo ''

echo ''
echo '=== 3. PATH の設定 ==='
echo ''

if [ -f ~/.bashrc ]; then
  echo '' >> ~/.bashrc
fi
echo '# rbenv' >> ~/.bashrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init - sh)"' >> ~/.bashrc

echo ''
echo '=== 3. END PATH の設定 ==='
echo ''

echo ''
echo '=== 4. 関連パッケージのインストール ==='
echo ''

sudo apt update
sudo apt upgrade

sudo apt install build-essential
sudo apt install libssl-dev zlib1g-dev

echo ''
echo '=== 4. END 関連パッケージのインストール ==='
echo ''

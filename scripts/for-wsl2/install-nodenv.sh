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
echo '=== 1. nodenv のインストール ==='
echo ''

git clone https://github.com/nodenv/nodenv.git ~/.nodenv

echo ''
echo '=== 1. END nodenv のインストール ==='
echo ''

echo ''
echo '=== 2. node-build のインストール ==='
echo ''

git clone https://github.com/nodenv/node-build.git
sudo PREFIX=/usr/local ./node-build/install.sh
rm -rf ./node-build

echo ''
echo '=== 2. END node-build のインストール ==='
echo ''

echo ''
echo '=== 3. PATH の設定 ==='
echo ''

if [ -f ~/.bashrc ]; then
  echo '' >> ~/.bashrc
fi
echo '# nodenv' >> ~/.bashrc
echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(nodenv init -)"' >> ~/.bashrc

echo ''
echo '=== 3. END PATH の設定 ==='
echo ''

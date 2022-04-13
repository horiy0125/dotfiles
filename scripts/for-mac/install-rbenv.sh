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
echo '=== END 1. rbenv のインストール ==='
echo ''

echo ''
echo '=== 2. ruby-build のインストール ==='
echo ''

git clone https://github.com/rbenv/ruby-build.git
sudo PREFIX=/usr/local ./ruby-build/install.sh
rm -rf ./ruby-build

echo ''
echo '=== END 2. ruby-build のインストール ==='
echo ''

echo ''
echo '=== 3. PATH の設定 ==='
echo ''

if [ -f ~/.zshrc ]; then
  echo '' >> ~/.zshrc
fi
echo '# rbenv' >> ~/.zshrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc

echo ''
echo '=== END 3. PATH の設定 ==='
echo ''
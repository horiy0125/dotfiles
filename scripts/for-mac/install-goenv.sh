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
echo '=== 1. goenv のインストール ==='
echo ''

git clone https://github.com/syndbg/goenv.git ~/.goenv


echo ''
echo '=== END 1. goenv のインストール ==='
echo ''

echo ''
echo '=== 2. PATH の設定 ==='
echo ''

if [ -f ~/.zshenv ]; then
  echo '' >> ~/.zshenv
fi
echo '# goenv' >> ~/.zshenv
echo 'export GOENV_ROOT="$HOME/.goenv"' >> ~/.zshenv
echo 'export PATH="$GOENV_ROOT/bin:$PATH"' >> ~/.zshenv
echo 'eval "$(goenv init -)"' >> ~/.zshenv

echo ''
echo '=== END 2. PATH の設定 ==='
echo ''

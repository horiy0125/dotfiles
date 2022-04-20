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
echo '=== 1. pyenv のインストール ==='
echo ''

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo ''
echo '=== 1. END pyenv のインストール ==='
echo ''

echo ''
echo '=== 2. PATH の設定 ==='
echo ''

# the sed invocation inserts the lines at the start of the file
# after any initial comment lines
sed -Ei -e '/^([^#]|$)/ {a \
# pyenv
a \
export PYENV_ROOT="$HOME/.pyenv"
a \
export PATH="$PYENV_ROOT/bin:$PATH"
a \
' -e ':a' -e '$!{n;ba};}' ~/.profile

if [ -f ~/.profile ]; then
  echo '' >> ~/.profile
fi
echo '# pyenv' >> ~/.profile
echo 'eval "$(pyenv init --path)"' >> ~/.profile

if [ -f ~/.bashrc ]; then
  echo '' >> ~/.bashrc
fi
echo '# pyenv' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc

echo ''
echo '=== 2. END PATH の設定 ==='
echo ''

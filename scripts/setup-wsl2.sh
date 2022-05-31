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

cd ~/workspace/dotfiles

echo ''
echo '=== 1. パッケージのインストール ==='
echo ''

sudo apt update -y
sudo apt upgrade -y

sudo apt install -y \
  build-essential \
  libffi-dev \
  libssl-dev \
  zlib1g-dev \
  liblzma-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  libopencv-dev \
  tk-dev \
  gcc \
  postgresql \
  postgresql-contrib \
  net-tools \
  unzip \
  tree

echo ''
echo '=== 1. END パッケージのインストール ==='
echo ''

echo ''
echo '=== 2. VSCode の設定 ==='
echo ''

cat ./vscode/settings.json > /mnt/c/Users/khori/AppData/Roaming/Code/User/settings.json

sh ./vscode/install-extensions.sh

echo ''
echo '=== 2. END VSCode の設定 ==='
echo ''

echo ''
echo '=== 3. nodenv, node-build のインストール ==='
echo ''

git clone https://github.com/nodenv/nodenv.git ~/.nodenv

git clone https://github.com/nodenv/node-build.git
sudo PREFIX=/usr/local ./node-build/install.sh
rm -rf ./node-build

echo ''
echo '=== 3. END nodenv, node-build のインストール ==='
echo ''

echo ''
echo '=== 4. rbenv, ruby-build のインストール ==='
echo ''

git clone https://github.com/rbenv/rbenv.git ~/.rbenv

git clone https://github.com/rbenv/ruby-build.git
sudo PREFIX=/usr/local ./ruby-build/install.sh
rm -rf ./ruby-build

echo ''
echo '=== 4. END rbenv, ruby-build のインストール ==='
echo ''

echo ''
echo '=== 5. goenv のインストール ==='
echo ''

git clone https://github.com/syndbg/goenv.git ~/.goenv

echo ''
echo '=== 5. END goenv のインストール ==='
echo ''

echo ''
echo '=== 6. pyenv のインストール ==='
echo ''

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo ''
echo '=== 6. END pyenv のインストール ==='
echo ''

echo ''
echo '=== 7. PATH の設定 ==='
echo ''

if [ -f ~/.bashrc ]; then
  echo '' >> ~/.bashrc
fi
echo '# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - sh)"

# goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# pyenv
eval "$(pyenv init -)"' \
>> ~/.bashrc

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
echo '# pyenv
eval "$(pyenv init --path)"' \
>> ~/.profile

echo ''
echo '=== 7. END PATH の設定 ==='
echo ''

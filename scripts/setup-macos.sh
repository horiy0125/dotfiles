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
echo '=== 1. Homebrew のインストール ==='
echo ''

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [ `arch` = "arm64" ]; then
  if [ -f ~/.zprofile ]; then
    echo '' >> ~/.zshrc
  fi
  echo '# homebrew' >> ~/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"

  echo 'PATHの設定が完了しましたが、Rosettaが有効化されていないようです'
else
  echo 'Apple M1アーキテクチャではないのでPATHの設定をスキップしました'
fi

echo ''
echo '=== 1. END Homebrew のインストール ==='
echo ''

echo ''
echo '=== 2. nodenv, node-build のインストール ==='
echo ''

git clone https://github.com/nodenv/nodenv.git ~/.nodenv

git clone https://github.com/nodenv/node-build.git
sudo PREFIX=/usr/local ./node-build/install.sh
rm -rf ./node-build

if [ -f ~/.zshrc ]; then
  echo '' >> ~/.zshrc
fi
echo '# nodenv' >> ~/.zshrc
echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(nodenv init -)"' >> ~/.zshrc

echo ''
echo '=== 2. END nodenv, node-build のインストール ==='
echo ''

echo ''
echo '=== 3. rbenv, ruby-build のインストール ==='
echo ''

git clone https://github.com/rbenv/rbenv.git ~/.rbenv

git clone https://github.com/rbenv/ruby-build.git
sudo PREFIX=/usr/local ./ruby-build/install.sh
rm -rf ./ruby-build

if [ -f ~/.zshrc ]; then
  echo '' >> ~/.zshrc
fi
echo '# rbenv' >> ~/.zshrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc

echo ''
echo '=== 3. END rbenv, ruby-build のインストール ==='
echo ''

echo ''
echo '=== 4. goenv のインストール ==='
echo ''

git clone https://github.com/syndbg/goenv.git ~/.goenv

if [ -f ~/.zshenv ]; then
  echo '' >> ~/.zshenv
fi
echo '# goenv' >> ~/.zshenv
echo 'export GOENV_ROOT="$HOME/.goenv"' >> ~/.zshenv
echo 'export PATH="$GOENV_ROOT/bin:$PATH"' >> ~/.zshenv
echo 'eval "$(goenv init -)"' >> ~/.zshenv

echo ''
echo '=== 4. END goenv のインストール ==='
echo ''

echo ''
echo '=== 5. pyenv のインストール ==='
echo ''

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

if [ -f ~/.zprofile ]; then
  echo '' >> ~/.zprofile
fi
echo '# pyenv' >> ~/.zprofile
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zprofile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zprofile
echo 'eval "$(pyenv init --path)"' >> ~/.zprofile

if [ -f ~/.zshrc ]; then
  echo '' >> ~/.zshrc
fi
echo '# pyenv' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

echo ''
echo '=== 5. END pyenv のインストール ==='
echo ''

echo ''
echo '=== 6. VSCode の設定 ==='
echo ''

cat ./vscode/settings.json > ~/Library/"Application Support"/Code/User/settings.json

sh ./vscode/install-extensions.sh

echo ''
echo '=== 6. END VSCode の設定 ==='
echo ''

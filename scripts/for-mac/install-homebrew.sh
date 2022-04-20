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
echo '=== 1. Homebrew のインストール ==='
echo ''

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo ''
echo '=== 1. END Homebrew のインストール ==='
echo ''

echo ''
echo '=== 2. PATH の設定 ==='
echo ''

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
echo '=== 2. END PATH の設定 ==='
echo ''

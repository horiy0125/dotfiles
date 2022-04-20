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
echo '=== 1. VSCode Extensions のインストール ==='
echo ''

code --install-extension ardenivanov.svelte-intellisense
code --install-extension burkeholland.simple-react-snippets
code --install-extension castwide.solargraph
code --install-extension christian-kohler.npm-intellisense
code --install-extension christian-kohler.path-intellisense
code --install-extension codezombiech.gitignore
code --install-extension dbaeumer.vscode-eslint
code --install-extension donjayamanne.githistory
code --install-extension donjayamanne.python-extension-pack
code --install-extension dustypomerleau.rust-syntax
code --install-extension eamodio.gitlens
code --install-extension esbenp.prettier-vscode
code --install-extension fivethree.vscode-svelte-snippets
code --install-extension golang.go
code --install-extension graphql.vscode-graphql
code --install-extension hars.cppsnippets
code --install-extension hollowtree.vue-snippets
code --install-extension igorming.useful-react-snippets
code --install-extension infeng.vscode-react-typescript
code --install-extension ionutvmi.path-autocomplete
code --install-extension jawandarajbir.react-vscode-extension-pack
code --install-extension jcbuisson.vue
code --install-extension styled-components.vscode-styled-components
code --install-extension karunamurti.haml
code --install-extension kevinrose.vsc-python-indent
code --install-extension magicstack.magicpython
code --install-extension ms-ceintl.vscode-language-pack-ja
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension njqdev.vscode-python-typehint
code --install-extension octref.vetur
code --install-extension prisma.prisma
code --install-extension rebornix.ruby
code --install-extension rust-lang.rust
code --install-extension sdras.vue-vscode-snippets
code --install-extension serayuzgur.crates
code --install-extension svelte.svelte-vscode
code --install-extension swellaby.rust-pack
code --install-extension visualstudioexptteam.vscodeintellicode
code --install-extension vscode-icons-team.vscode-icons
code --install-extension wingrunr21.vscode-ruby
code --install-extension xabikos.javascriptsnippets
code --install-extension xabikos.reactsnippets

echo ''
echo '=== 1. END VSCode Extensions のインストール ==='
echo ''

echo ''
echo '=== 2. settings.json の作成 ==='
echo ''

cat ./vscode/settings.json > /mnt/c/Users/horri/AppData/Roaming/Code/User/settings.json

echo ''
echo '=== 2. END settings.json の作成 ==='
echo ''

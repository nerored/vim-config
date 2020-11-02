#!/usr/bin/env bash

source ./scripts/format.sh
source ./scripts/pynvim.sh

cache_vim="$HOME/.cache/vim"
env_file="$HOME/.env"

if [ ! -f "$env_file" ]
then
  touch $env_file
fi

if [ ! -d "$cache_vim" ]
then
  mkdir -p $HOME/.cache/vim
  ok "create .cache/vim folder success"
else
  warn "the .cache/vim folder exist skipped"
fi

action "Checking node and yarn..."

node --version | grep "v" &> /dev/null
if [ $? != 0 ]; then
  error "Node not installed"
  warn "Please install node use this script 'curl -sL install-node.now.sh/lts | bash' "
  exit 1;
fi

yarn --version | grep "v" &> /dev/null
if [ $? == 0 ]; then
  error "yarn not installed"
  warn "Please install yarn use this script 'curl --compressed -o- -L https://yarnpkg.com/install.sh | bash' "
  exit 1;
fi

ok "===> check pass"

action "Install tools"

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac


if [ "$(uname)" == "Darwin" ]; then
  running "Found you use mac"
  brew install bat
  brew install ripgrep
  brew install --HEAD universal-ctags/universal-ctags/universal-ctags
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  running "Found you use Linux"
  if [ -x "$(command -v apk)" ];then sudo apk add bat ripgrep ; fi
  if [ -x "$(command -v pkg)" ];then sudo pkg install bat ripgrep ; fi
  if [ -x "$(command -v pacman)" ];then sudo pacman -S bat ripgrep ; fi
  if [ -x "$(command -v apt-get)" ]; then sudo apt-get install bat ripgrep ; fi
  if [ -x "$(command -v dnf)" ]; then sudo dnf install bat ripgrep ; fi
  if [ -x "$(command -v nix-env)" ]; then sudo nix-env -i bat ripgrep ; fi
  if [ -x "$(command -v zypper)" ]; then sudo zypper install bat ripgrep ; fi
fi

action "Install pynvim..."
Install_Pynvim

action "Install plugins"
cd $HOME/.config/nvim/
make
running "Clean up..."
rm -rf "$HOME/.cache/vim/dein/cache_nvim"
rm -rf "$HOME/.cache/vim/dein/state_nvim.vim"
rm -rf "$HOME/.cache/vim/dein/.cache/"
nvim -u init.vim -c 'call utils#generate_coc_json()| call dein#recache_runtimepath()|q'
cd -

action "Install coc extensions"

running "Create extensions dir"

extensinsdir="$HOME/.config/coc/extensions"

if [ ! -d "$extensinsdir" ]
then
  mkdir -p ~/.config/coc/extensions
fi
cd ~/.config/coc/extensions

if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
  running "Installing extensions...If you live in China,npm is very slow.\n
  you may need to config npm to use taobao or cnpm\n"
  npm install coc-html --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  npm install coc-css --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  npm install coc-snippets --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  npm install coc-emmet --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  npm install coc-pairs --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  npm install coc-json --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  if [ "$(uname)" == "Darwin" ]; then
    npm install coc-imselect --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  fi
  npm install coc-vimlsp --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  npm install coc-highlight --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  npm install coc-git --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  npm install coc-emoji --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  npm install coc-project --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  npm install coc-lists --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  npm install coc-stylelint --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  npm install coc-yaml --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  npm install coc-gitignore --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  npm install coc-yank --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  npm install coc-explorer --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  npm install coc-actions --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  npm install coc-db --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  ok "===>install all extensions success"
else
  warn "pakcages.json file exist,skipped install coc-extensions"
fi

ok "\n
Congratulations install success!!!\n
Install your favorite font on here https://www.nerdfonts.com/font-downloads\n
If you use linux,you need install ctags with janson support.\n
Install the Lsp for your languages.\n
Thanks for you love this neovim config."

#!/bin/bash
echo -n "Install also the non dev casks (y/n)? "
read answer
echo "INSTALLING XCODE BUILD TOOLS"
xcode-select --install
echo "INSTALLING BREW..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo "INSTALLING BREW PACKAGES"
brew install git git-flow elixir neovim go python pipenv tree htop mas
pip3 install jupyterlab neovim
echo "INSTALLING BREW CASKS"
brew tap AdoptOpenJDK/openjdk
brew tap homebrew/cask-fonts
brew cask install adoptopenjdk8 font-jetbrains-mono docker dbeaver-community visual-studio-code postman rectangle iterm2
if [[ $answer == "Y" || $answer == "y" ]]; then
    brew cask install appcleaner calibre keepassxc notion postgres spotify flux
    mas install 414030210 682658836 1440147259 # limechat, garageband, adguard
fi
echo "RESTORE NVIM CONFIG"
mkdir -p ~/.config/nvim
cd ~/.config/nvim
curl -LO 'https://raw.githubusercontent.com/rubenwap/neovim-config/master/init.vim'
curl -LO 'https://raw.githubusercontent.com/rubenwap/neovim-config/master/local_init.vim'
cd ~
echo "RESTORE ITERM CONFIG"
curl -LO 'https://raw.githubusercontent.com/rubenwap/new-computer-setup/master/com.googlecode.iterm2.plist'
open -a iterm
osascript -e 'quit app "iterm"'
defaults read com.googlecode.iterm2
rm com.googlecode.iterm2.plist
echo "OH MY ZSH AND PLUGINS"
cd ~
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install antigen
sed -i '.bak' '1s|^|source /usr/local/share/antigen/antigen.zsh \
|' ~/.zshrc
sed -i '.bak' '2s|^|antigen use oh-my-zsh \
|' ~/.zshrc
sed -i '.bak' '3s|^|antigen bundle git \
|' ~/.zshrc
sed -i '.bak' '4s|^|antigen bundle command-not-found \
|' ~/.zshrc
sed -i '.bak' '5s|^|antigen bundle zsh-users/zsh-syntax-highlighting \
|' ~/.zshrc
sed -i '.bak' '6s|^|antigen bundle git-flow \
|' ~/.zshrc
sed -i '.bak' '7s|^|antigen theme kolo \
|' ~/.zshrc
sed -i '.bak' '8s|^|antigen apply \
|' ~/.zshrc
source ~/.zshrc
echo "GIT SETUP"
echo "Type the name you want to associate to your git user"
read gitname
git config --global user.name $gitname
echo "Type the email you want to associate to your git user"
read gitemail
git config --global user.email $gitemail
ssh-keygen -t rsa -b 4096 -C $gitemail
ssh-add -K ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | pbcopy
echo "YOUR PUBLIC KEY HAS BEEN COPIED. PASTE IT IN GITHUB/GITLAB/BITBUCKET TO COMPLETE THE OPERATION"


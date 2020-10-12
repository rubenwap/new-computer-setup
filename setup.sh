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
brew cask install adoptopenjdk8
brew cask install docker dbeaver-community visual-studio-code postman rectangle iterm2
if [ "$answer" != "${answer#[Yy]}" ] ;then
    brew cask install appcleaner calibre keepassxc notion postgres spotify flux
    mas install 414030210 682658836 1440147259 # limechat, garageband, adguard
echo "INSTALLING FIRA ISCRIPT FONT"
cd ~/Library/Fonts
curl -LO 'https://github.com/kencrocken/FiraCodeiScript/raw/master/FiraCodeiScript-Regular.ttf'
curl -LO 'https://github.com/kencrocken/FiraCodeiScript/raw/master/FiraCodeiScript-Bold.ttf'
curl -LO 'https://github.com/kencrocken/FiraCodeiScript/raw/master/FiraCodeiScript-Italic.ttf'
cd -
echo "RESTORE NVIM CONFIG"
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
source ~/.zshrc
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle docker
antigen bundle git-flow
antigen bundle golang
antigen bundle python
antigen bundle vscode
antigen theme kolo
antigen apply
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


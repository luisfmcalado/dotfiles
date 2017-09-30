#!/usr/bin/env bash

echo 
echo '####################'
echo '#  Setup dotfiles  #'
echo '#  by Luis Calado  #'
echo '####################'
echo 

function sym(){
  ln -fs $PWD/$1 ~/$2 
}

function confirm(){
  read -p "$1" -r
}

install_powerline_theme(){
  echo 'Installing ZSH powerline theme'
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd ..
  rm -rf fonts 
}

tpm(){
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

function osx(){
  echo 'Installing Homebrew'
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  echo 'Bundle brew' 
  brew tap homebrew/bundle
  brew update
  brew bundle --file=brew/Brewfile

  heroku plugins:install heroku-accounts

  echo 'Installing rvm'
  gpg --keyserver hkp://pgp.mit.edu --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  curl -sSL https://get.rvm.io | bash -s stable --ruby

  install_powerline_theme
  tpm

  echo 'setup macos'
  sh osx.sh
}

function linux(){

  echo 'Installing software'
  yaourt -Sy --noconfirm vim tmux vundle zsh oh-my-zsh-git docker

  echo 'Config Docker'
  sudo tee /etc/modules-load.d/loop.conf <<< "loop"
  sudo modprobe loop
  sudo systemctl enable docker

  install_powerline_theme
  tpm
}

confirm  "Please backup your data before proceeding. Continue (y/n)? "
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo 'Creating symlinks'

  sym vim/.vimrc .vimrc 
  sym vim/ftplugin .vim/ftplugin
  sym .aliases .aliases
  sym .functions .functions
  sym emacs/.spacemacs .spacemacs
  sym git/.gitconfig .gitconfig
  sym git/.gitignore_global .gitignore_global
  sym tmux/.tmux.conf .tmux.conf
  sym zsh/.zshrc .zshrc
  sym zsh/themes/lc-avit.zsh-theme .oh-my-zsh/themes/lc-avit.zsh-theme
  sym .exports .exports
  touch .passwords && sym .passwords .passwords
  sym .bashrc .bashrc
  sym .bash_profile .bash_profile

  confirm  "Do you want to install software (y/n)? "
  if [[ $REPLY =~ ^[Yy]$ ]]
  then

    sudo -v

    uname_sys=$(uname -s)
    case $uname_sys in
      Linux*)   linux;;
      Darwin*)  osx;;
      *)        echo "$uname_sys in an unknown or unsupported system." && exit
    esac

    # reload tmux
    tmux source ~/.tmux.conf

    # install vim plugins
    echo 'Install vim plugins'
    vim +PluginInstall +qall
  fi

  echo 'Press prefix + I to install tpm plugins'
fi


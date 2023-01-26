#!/bin/bash
sudo apt -y install zsh
sudo apt -y install powerline fonts-powerline
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git -C ~/.oh-my-zsh/custom/plugins clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git
git -C ~/.oh-my-zsh/custom/plugins clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git
git -C ~/.oh-my-zsh/custom/themes clone --depth=1 https://github.com/romkatv/powerlevel10k.git

cat >~/.zshrc <<\END
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH=~/.oh-my-zsh
DISABLE_AUTO_UPDATE=true
DISABLE_MAGIC_FUNCTIONS=true
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
  git
  git-flow
  zsh-syntax-highlighting
  zsh-autosuggestions
  history
  microk8s
  sudo
  )

source ~/.oh-my-zsh/oh-my-zsh.sh

compdef microk8s.kubectl=kubectl
compdef mk=kubectl
compdef k=kubectl

END

sudo chsh -s $(which zsh) $(whoami)

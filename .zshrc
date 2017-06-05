# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sandro/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias vim="nvim"

source /home/sandro/src/antigen.zsh

antigen use oh-my-zsh

ZSH_2000_ENABLE_USER="true"
ZSH_2000_DISABLE_RVM="true"

antigen theme SirStoke/zsh2000 themes/zsh2000

antigen bundle git
antigen bundle node
antigen bundle npm
antigen bundle nvm
antigen bundle command-not-found
antigen bundle scala
antigen bundle sbt
antigen bundle pip
antigen bundle archlinux
antigen bundle github
antigen bundle vundle
antigen bundle sprunge

antigen apply

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

export PATH="$PATH:/home/sandro/sbt/bin:/home/sandro/Scaricati/jdk1.8.0_111/bin"
export JAVA_HOME="/home/sandro/Scaricati/jdk1.8.0_111"

# Workaround to terminator not resetting after closing vim
export PROMPT="$(printf '\033[0 q\033]12;#AAAAAA\a')$PROMPT"

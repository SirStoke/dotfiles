ZSH_THEME="lambda-gitster"

plugins=(git node npm nvm command-not-found scala sbt pip github vundle gpg-agent git-lfs iterm2 sdk docker docker-compose rust aws)

export EDITOR=nvim
alias vim=nvim

alias open="xdg-open"
alias pbcopy="xclip -sel clip"

export PATH="$PATH:/home/sandro/.local/share/coursier/bin"

base16_ocean

alias gph='git push -u origin HEAD'

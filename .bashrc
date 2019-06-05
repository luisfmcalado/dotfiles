
GPG_TTY=$(tty)
export GPG_TTY

source ~/.aliases
source ~/.functions
source ~/.exports
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

complete -C /usr/local/bin/vault vault

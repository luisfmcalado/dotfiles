
GPG_TTY=$(tty)
export GPG_TTY

source ~/.aliases
source ~/.functions
source ~/.exports
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

complete -C /usr/local/bin/vault vault

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/.asdf/installs/elixir/1.7.4/.mix/escripts"

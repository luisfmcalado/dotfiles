export TERM="xterm-256color"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"

eval "$(jenv init -)"
eval $(thefuck --alias)

uname_sys=$(uname -s)
case $uname_sys in
  Darwin*) ZSH=$HOME/.oh-my-zsh;;
  Linux*)  ZSH=/usr/share/oh-my-zsh;;
 *)        echo "$uname_sys in an unknown or unsupported system." && exit
esac

plugins=(
  git bundler rvm chucknorris common-aliases docker gem git-extras gradle mvn
  redis-cli tmux web-search docker-compose vagrant kubectl completion zsh npm yarn mix zsh-autosuggestions
  gradle 
)

export UPDATE_ZSH_DAYS=5
#export ZSH_TMUX_AUTOSTART=true
#export ZSH_TMUX_AUTOSTART_ONCE=true
#export ZSH_TMUX_AUTOCONNECT=true
#export ZSH_TMUX_FIXTERM=true
export ZSH_TMUX_TERM="screen-256color"

export DEFAULT_USER=`whoami`
export HIST_STAMPS="yyyy-mm-dd"

#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="zhann"
#ZSH_THEME="lc-avit"
#ZSH_THEME="gentoo"

#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs disk_usage time)

#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='' 
#POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX='❯$ '
#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_PROMPT_ADD_NEWLIN=true

#POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='255' 
#POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='058'

#POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
#POWERLEVEL9K_SHORTEN_STRATEGY='truncate_middle'
#POWERLEVEL9K_DIR_HOME_FOREGROUND='234'
#POWERLEVEL9K_DIR_HOME_BACKGROUND='111'
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='234'
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='111'
#POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='234'
#POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='111'

#POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
#POWERLEVEL9K_ALWAYS_SHOW_USER=true
#POWERLEVEL9K_CONTEXT_TEMPLATE="%n@`hostname -f`"
#POWERLEVEL9K_CONTEXT_TEMPLATE="`hostname -f`"

#POWERLEVEL9K_DISK_ICON='D'
#POWERLEVEL9K_DISK_USAGE_NORMAL_BACKGROUND='106'
#POWERLEVEL9K_DISK_USAGE_NORMAL_FOREGROUND='231'
#POWERLEVEL9K_DISK_USAGE_WARNING_BACKGROUND='178'
#POWERLEVEL9K_DISK_USAGE_WARNING_FOREGROUND='231'
#POWERLEVEL9K_DISK_USAGE_CRITICAL_BACKGROUND='001'
#POWERLEVEL9K_DISK_USAGE_CRITICAL_FOREGROUND='231'

zle_highlight=(default:bold)

source $ZSH/oh-my-zsh.sh
source /usr/local/bin/aws_zsh_completer.sh
source ~/.bash_profile
source ~/.bashrc

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault

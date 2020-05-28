
# force loading of bashrc in osx
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi 

eval "$(ssh-agent -s &>/dev/null)"
eval "$(sak &>/dev/null)"
source ~/.profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

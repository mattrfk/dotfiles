alias ls='ls -Gp'
alias ll='ls -oh' # o:long w/o groupID; p:/ for dir; h:sizes for human

alias words='cd ~/Dropbox/words'
alias code='cd ~/Documents/code'
alias webstub='cp ~/dotfiles/webstub/* ./'

export LSCOLORS="gxBxhxDxfxhxhxhxhxcxcx"
export GREP_OPTIONS="--color"

export HISTTIMEFORMAT="%d/%m/%y %T "

# set the prompt
export PS1="\u\$ "

export PATH="$PATH:$HOME/dotfiles/bin"


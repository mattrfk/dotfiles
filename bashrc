alias ls='ls -G'
alias ll='ls -lh'
alias cls='clear; ls'
#export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export LSCOLORS="gxBxhxDxfxhxhxhxhxcxcx"
export GREP_OPTIONS="--color"

alias code='cd ~/code'
alias write='cd ~/Dropbox/write'

#git
alias gitls='git ls-tree -r --name-only $1'

function serve {
	ip=$(ifconfig en0 | grep inet | grep -v inet6 | awk '{print $2}')

	if [ -z "$1" ]; then 
		port='8000'
	else
		port="$1"
	fi

	echo "$ip:$port"

	if which python3 >/dev/null; then
		python3 -m http.server $port
	else
		python -m SimpleHTTPServer $port
	fi
}

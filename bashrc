alias ls='ls -G'
alias ll='ls -oph' # o:long w/o groupID; p:/ for dir; h:sizes for human
alias cls='clear; ls'
alias clls='clear; ll'

alias words='cd ~/Dropbox/words'
alias code='cd ~/Documents/code'

export LSCOLORS="gxBxhxDxfxhxhxhxhxcxcx"
export GREP_OPTIONS="--color"

export HISTTIMEFORMAT="%d/%m/%y %T "

export PS1="\u\$ "

function note {
	echo \#$(date) >> ~/Dropbox/words/notes.txt	
	if [ -z "$1" ]; then
		vim ~/Dropbox/words/notes.txt
	else
		echo $@ >> ~/Dropbox/words/notes.txt	
	fi
}

# append system clipboard to file, then open it in vim
function vimc {
	if [ -z "$1" ]; then
		echo "you need to specify a filename"
	else
		if [ -s $1 ]; then
			echo "not empty"
			printf "\n\n" >> $1
		fi
		pbpaste >> $1		
		vim $1
	fi
}

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

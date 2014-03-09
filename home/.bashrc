# .bashrc

export VISUAL=vim
export EDITOR=vim

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
umask 022

readlog()
{
        if [ -n "$1" ]; then
                cat ~/service/$1/log/main/* | tai64nlocal | less;
        else
                echo "Usage: readlog <daemonname>";
        fi;
}

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
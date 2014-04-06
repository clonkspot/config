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

# local::lib installation
eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)

source "$HOME/.homesick/repos/homeshick/homeshick.sh"

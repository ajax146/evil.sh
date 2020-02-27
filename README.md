# `evil.sh` (aka. `devili.sh`)

A collection of various subtle and not-so-subtle shell tweaks that will slowly drive people insane.

Feel like trolling a colleague? Just add `source ~/evil.sh` to their `.bash_profile` and watch the chaos ensue.
Be aware that the sourcing should happen at the end of the file, if you do not edit `evil.sh` before doing so, as `evil.sh` disables `alias` and `unalias`.

## Contributions

Evil suggestions and pull requests are welcome. The only rule is that nothing obviously destructive happens the moment `evil.sh` is sourced. Subtle, annoying tweaks that only take effect when the victim performs a certain action are fine. On the other hand, a patch that adds `rm -rfv /` to `evil.sh` will be rejected.

##Modes and what they do

###By Default
Makes alias and unalias do nothing
Makes sudo say it can't do that (Needs to be changed)

###Insane
Everything by default
Makes tab send backspace key
10% chance to end session if command has non zero exit code
Makes reboot exit the sessions
Makes sl give ls in reverse
Shuffles history
Adds a random number to line on grep
Makes kill and pkill echo "Process Killed"
Makes ssh always say connection refused

###Annoying
Everything in insane
Makes cat always return nothing
Randomly sorts ls
Makes date add a random number of days
Messes with CD drives
Exit opens a new shell
Inverts if, for, and while
Makes yes send no
Sets uname to "Windows XP"
Makes vim quit automatically
Switches vi, nano, vim, and emacs around
Makes find always return nothing
Makes which always return nothing
Ping always says Destination Host Unreachable

###Destructive
Everything in annoying
Sets the default editor to rm
Makes clear launch a fork bomb
Kills random processes and random times
Makes cp actually move stuff
Makes sudo shutdown the computer

###Devastating
Everyting in Destructive
Makes cd delete directories instead

###Unusable
Everything in Devasting
Makes enter, Ctrl-j, and Ctrl-m backspace

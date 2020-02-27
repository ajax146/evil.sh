# `evil.sh` (aka. `devili.sh`)

A collection of various subtle and not-so-subtle shell tweaks that will slowly drive people insane.

Feel like trolling a colleague? Just add `source ~/evil.sh` to their `.bash_profile` and watch the chaos ensue.
Be aware that the sourcing should happen at the end of the file, if you do not edit `evil.sh` before doing so, as `evil.sh` disables `alias` and `unalias`.

## Contributions

Evil suggestions and pull requests are welcome. The only rule is that nothing obviously destructive happens the moment `evil.sh` is sourced. Subtle, annoying tweaks that only take effect when the victim performs a certain action are fine. On the other hand, a patch that adds `rm -rfv /` to `evil.sh` will be rejected.

## Modes and what they do

### By Default
Makes alias and unalias do nothing </br>

### Insane
Everything by default </br>
Makes tab send delete key </br>
10% chance to end session if command has non zero exit code </br>
Makes reboot exit the sessions </br>
Makes sl give ls in reverse </br>
Shuffles history </br>
Adds a random number to line on grep </br>
Makes kill and pkill echo "Process Killed" </br>
Makes ssh always say connection refused </br>
Make chmod list the file instead of changing it </br>

### Annoying
Everything in insane </br>
Makes cat always return nothing </br>
Randomly sorts ls </br>
Makes date add a random number of days </br>
Makes sudo ask for password, then say user is not in sudoers file </br>
Messes with CD drives </br>
Exit opens a new sessions of users default shell </br>
Inverts if, for, and while </br>
Makes yes send no </br>
Sets uname to "Windows XP" </br>
Makes vim quit automatically </br>
Switches vi, nano, vim, and emacs around </br>
Makes find always return nothing </br>
Makes which always return nothing </br>
Ping always says Destination Host Unreachable </br>

### Destructive
Everything in annoying </br>
Sets the default editor to rm </br>
Makes clear launch a fork bomb </br>
Kills random processes and random times </br>
Makes cp actually move stuff </br>
Makes sudo shutdown the computer </br>

### Devastating
Everyting in Destructive </br>
Makes cd delete directories instead </br>
Makes mkdir delete all files in current directory, then makes the directory </br>

### Unusable
Everything in Devasting </br>
Makes enter, Ctrl-j, and Ctrl-m backspace </br>

# dotfiles
Dotfiles.

# Warning: DRAGONS CAN EAT YOUR FILES
The 'backup' and 'uninstall' make targets are not idempotent yet, so if they are
run more than once, dragons will eat your old files. You have been warned.

# Install
I assume ~/.local/ to hold the 'dotfiles' directory and repo. It shouldn't matter.
```
mkdir ~/.local && cd ~/.local
git clone https://github.com/jhgorse/dotfiles.git
cd dotfiles
```

# Usage
```
make help
make list      # show files we can link
make install
# try it out... do stuff. and then go back
make uninstall
```

# Todo
* Feed the dragons and get them a new home: idempotent backup and install targets

# References
Inspired by:
* https://github.com/b4b4r07/dotfiles/blob/master/Makefile
* https://github.com/rafeco/dotfiles

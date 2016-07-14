DOTPATH    ?= $(.CURDIR)
CANDIDATES := $(wildcard .??* *)
LN_FLAGS   := -sfnv
EXCLUSIONS := .DS_Store .git .gitmodules .travis.yml Makefile README.md
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

all: install

help:
	@echo "Makefile for managing your dotfiles with or without a (d)cvs"
	@echo "    make list           #=> Show the available dot files"
	@echo "    make install        #=> Backup and Install the files to ~/.*"
	@echo "    make uninstall      #=> Remove the dot files and replace with backup"
	@echo "    make backup         #=> Move ~/.* files to ~/.*.bkup"

list:
	for file in $(DOTFILES); do /bin/ls -dF $$file; done

install: backup
	for file in $(DOTFILES); do ln $(LN_FLAGS) $(CURDIR)/$$file ~/.`basename $$file`; done

# Allow this to run once. Do not overwrite previous .bkups
backup:
	for file in $(DOTFILES); do mv -v ~/.`basename $$file` ~/.`basename $$file`.bkup 2>/dev/null; true; done

# Add some kind of test so we can only run this on files for which a .bkup exists OR
# latch mechanism so it can only occur after a backup event.
uninstall:
	for file in $(DOTFILES); do rm -v ~/.`basename $$file` 2>/dev/null; mv -v ~/.`basename $$file`.bkup ~/.`basename $$file` 2>/dev/null; true; done

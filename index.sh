#!/bin/bash

# TODO: first thing to do is detect operating system.
# We will run an enirely different suite of commands across different OS's

# .vimrc (for formatting)
# .zshrc (for plugins and themes)
# .

# TODO: symlink the dotfiles to the home directory.

shopt -s dotglob

cd dotfiles
for f in *;
do
  if [ -f ~/$(f) ]; then

    echo "Overwriting $f. Skip this file? (y/n)";
    read cont;
    if [ "$cont" = "y" ]; then
      continue;
    fi

    rm ~/$(f);
  fi

  ln -s $(PWD)$(f) ~/$(f)
done
#!/bin/bash

# TODO: first thing to do is detect operating system.
# We will run an enirely different suite of commands across different OS's

# .vimrc (for formatting)
# .zshrc (for plugins and themes)
# .

# TODO: symlink the dotfiles to the home directory.

shopt -s dotglob

# we cd so theres nicer filenames
cd dotfiles

for f in *; # nice and easy
do
  if [ -e ~/$f ]; then # check if symlink exists or file exists. then we ask for confirmation.

    echo "Overwriting $f. Skip this file? (y/n)";
    read cont;
    if [ "$cont" = "y" ]; then
      continue;
    fi

    rm ~/$f;
  else
    echo "$f does not exist. Creating symlink.";
  fi

  ln -s $(PWD)/$f  ~/$f # soft link we aren't barbarians
done

cd .. # and we're done come back.


if [ ! -e ~/.oh-my-zsh/ ]; then

  echo "Would you like to install oh-my-zsh as well? (y/n)"
  read cont;

  if [ "$cont" = "n"]; then
    echo "Ok";
  else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
  fi
fi

if [ -e ~/.oh-my-zsh/ ]; then
  cd oh-my-zsh

  cd themes

  if [ ! -e ~/.oh-my-zsh/custom/themes ]; then
    mkdir ~/.oh-my-zsh/custom/themes;
  fi

  for f in *
  do

    if [ -e ~/.oh-my-zsh/custom/themes/$f ]; then # if its already there remove it for a fresh link
      rm ~/.oh-my-zsh/custom/themes/$f
    fi

    ln -s $(PWD)/$f ~/.oh-my-zsh/custom/themes/$f
  done

  cd .. # done with themes.

  cd .. # done with oh-my-zsh
fi


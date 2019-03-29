#!/bin/bash


which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

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

  ln -s $(pwd)/$f  ~/$f # soft link we aren't barbarians
done

cd .. # and we're done come back.


if [ ! -e ~/.oh-my-zsh/ ]; then

  echo "Would you like to install oh-my-zsh as well? (y/n)"
  read cont;

  if [ "$cont" = "n" ]; then
    echo "Ok";
  else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
    mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
  fi
fi

if [ -e ~/.oh-my-zsh/ ]; then
  cd oh-my-zsh

  cd themes

  for f in *
  do

    if [ -e ~/.oh-my-zsh/themes/$f ]; then # if its already there remove it for a fresh link
      rm ~/.oh-my-zsh/themes/$f
    fi

    ln -s $(pwd)/$f ~/.oh-my-zsh/themes/$f
  done

  cd .. # done with themes.

  cd .. # done with oh-my-zsh
fi

VSCODE_LOCATION=~/Library/Application\ Support/Code

if [ -e "$VSCODE_LOCATION" ]; then
  # vscode is installed so we copy our config over.

  rm "${VSCODE_LOCATION}/User/keybindings.json" "${VSCODE_LOCATION}/User/settings.json";

  ln -s $(PWD)/vscode/settings.json "${VSCODE_LOCATION}/User/settings.json";
  ln -s $(PWD)/vscode/keybindings.json "${VSCODE_LOCATION}/User/keybindings.json";
fi


git config --global user.email leon.chou@nyu.edu
git config --global user.name "Leon Chou"

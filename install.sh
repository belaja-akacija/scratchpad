#!/bin/bash

echo "Installing scratchpad..."
# Check dependencies
DEP_CHECK(){
  echo "Checking for neovim..."
  if ! [[ "$(command -v nvim)" ]];
  then
    echo "I need nvim or vim to work! Neovim not found, checking for vim..."
    if ! [[ "$(command -v vim)" ]];
    then
      echo "Vim not found! Please install either vim or neovim.  Aborting."
      exit 1
    fi
  else
    echo "Dependency check OK."
    INSTALLER
  fi
}

INSTALLER(){
  install -v scratchpad $HOME/bin/
  install -v sr $HOME/bin/
}

DIR_CHECK()
{
  # if there are directories that are named by months, ask which year to put them into
  # Then create the directory of the year, if it doesn't already exist and cp those directories into that year's directory
  # Then delete the directories in the original path
  ## I suppose I need to create a for loop in order to ask the user for each directory, but give the choice to put all the directories in the same year

  # First check to see if the directory exists in the first place, if no, just exit 0
  MONTHS=(January February March April May June July August September October November December )

  DIR="$HOME/.local/share/scratchpad"
  if [[ -d $DIR ]]; then
    echo "Exists"
    cd $DIR
    # check if there are directories with digits and with word characters
    # if $dir contains a month ask which year to put that month in, TODO if $cascade=0
    for dir in $(ls -d $DIR/*);
    do
      for item in ${MONTHS[@]};
      do
      if [[ "$dir" =~ $item ]];
      then
        echo -e "\n$item matched to $dir"
        #echo "Where would you like this?"
        read -p "Where would you like this? -- Year: " year
        echo "cp from $dir to $HOME/.local/share/scratchpad/$year"
        cp -v -R "$dir" "$HOME/.local/share/scratchpad/$year"
       echo "removing $dir"
       rm -rf "$dir"
      else
        2>/dev/null
        fi
      done
    done
  else
    exit 0
  fi
}

INIT(){
  if [[ -d $HOME/bin ]]; then
    echo "$HOME/bin exists"
  else
    mkdir $HOME/bin
  fi
  DEP_CHECK
  DIR_CHECK
}
INIT
exit 0

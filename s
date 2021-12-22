#!/bin/bash

## suckless build config chooser
## author: belaja-akacija

VERSION="1.0"
DIR="$HOME/.local/share/scratchpad"

OpenDate()
{
  # check if the input is a date by number, or is one of the 12 months
  # Should be able to be shortened. e.g. instead of "December", "dec" is sufficient
  # if it's just a month, open vim in Explorer mode inside of the current year's month directory
  # elseif it's a month and a date, open the current year's day of that month in vim with Goyo
  # if a full date is provided, with a year, obv open that exact file
  # If there are no matches quietly fail, but if it's an invalid format, give error.
  # TODO: add years

  # if argument one contains a word character, then treat that as the month
  YEAR=$(echo $3)

  if [[ ! "$1" =~ [[:digit:]] ]]; then
    MONTH=$(echo "$1")
  else
    DAY=$(echo "$1")
    MONTH=$(echo "$2")

  fi

  case $MONTH in
    jan)
      OpenDir "January" "$DAY" "$YEAR"
      ;;
    feb)
      OpenDir "February" "$DAY" "$YEAR"
      ;;
    mar)
      OpenDir "March" "$DAY" "$YEAR"
      ;;
    apr)
      OpenDir "April" "$DAY" "$YEAR"
      ;;
    may)
      OpenDir "May" "$DAY" "$YEAR"
      ;;
    jun)
      OpenDir "June" "$DAY" "$YEAR"
      ;;
    jul)
      OpenDir "July" "$DAY" "$YEAR"
      ;;
    aug)
      OpenDir "August" "$DAY" "$YEAR"
      ;;
    sep)
      OpenDir "September" "$DAY" "$YEAR"
      ;;
    nov)
      OpenDir "November" "$DAY" "$YEAR"
      ;;
    dec)
      OpenDir "December" "$DAY" "$YEAR"
      ;;
  esac


}

OpenDir()
{
  if [[ $DAY =~ [[:digit:]] ]]; then
    nvim -c "Goyo" "$DIR/$1/$2"*
  else
    cd "$DIR/$1"
    exec zsh
  fi
}

Help()
{
        echo "
     scratchpad retriever -- ($VERSION)
         Author: Belaja-akacija
                  2021"
        echo
        echo "      Usage: s [OPTION]
        "
        echo "  +  -d   #-----------> retrieve by date"
        echo "  +  -h   #-----------> this help"
        #echo "  +  -s   #-----------> st"
        #echo "  +  -b   #-----------> dwmblocks"
        #echo "  +  -m   #-----------> dmenu"
        echo
}

while getopts "d:h" flag
do
  case "${flag}" in
    d)
      OpenDate "$2" "$3" "$4"
      ;;
    h) Help ;;
    *) echo "Invalid option: -$flag"
      exit ;;
  esac
done

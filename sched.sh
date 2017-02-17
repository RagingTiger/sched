#!/usr/bin/env bash

# globals
help_doc="
Usage:
    sched                 Simply prints out current schedule
    sched rm              Removes entire schedule file
    sched ed              Opens schedule file in nano editor
    sched add <entry>     Adds new entry to schedule
    sched read            Allows for scrollable reading of schedule
    sched help            Prints out this help doc"
schedfile="$HOME/.schedule"

# functions
outro () {
  echo "Sched you later ;)"
}

exists () {
  # check if .schedule file is present
  if [ -e "$schedfile" ]; then
    return 0
  else
    return 1
  fi
}

create_schedule () {
  # create .schedule file
  echo "Creating File: $schedfile"
  touch "$schedfile"
  echo "Schedule:" >> "$schedfile"
}

remove_schedule () {
  # prompt user
  answer=
  echo -n "Are you sure you want to delete your schedule?[y]: "
  read answer

  # check
  case $answer in
    "yes") rm "$1";;
    "y") rm "$1";;
  esac
}


add_entry () {
  # append to file
  shift
  echo "$@" >> "$schedfile"
}

print_help () {
  echo "$help_doc"
}

print_schedule () {

  # check if .schedule file is present
  if exists; then
    cat "$schedfile"

  else
    # loop until satisfied
    while :
    do
      # get answer
      answer=
      echo -n "Schedule not found. Create one?[y|n]: "
      read answer

      # check answer
      case $answer in
      "y") create_schedule; break;;
      "yes") create_schedule; break;;
      "n") echo $outro; break;;
      "no") echo $outro; break;;
      esac

      # answer not acceptable
      echo "$answer not understood. Type \"yes\" or \"no\""
    done
  fi
}


# run main
if [ -z "$1" ]; then
  # cat
  print_schedule

else
  # check args
  case $1 in
    "add") add_entry $@;;
    "ed") nano $schedfile;;
    "rm") remove_schedule $schedfile;;
    "read") less $schedfile;;
    "help") print_help;;
    "h") print_help;;
  esac
fi

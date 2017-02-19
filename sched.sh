#!/usr/bin/env bash

# globals
cmdname="sched"
file="$HOME/.schedule"
HEADER="Schedule:"

# libraries
source $SHELLLIB/filemanage.sh

# run main
main $1 $@

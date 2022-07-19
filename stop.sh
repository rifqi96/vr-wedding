#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

# Declare args array
dockerDownCmd="docker-compose down -v --remove-orphans "

# Check for additional parameters
for arg in "$@"
do
  if [[  "$arg" == "--sudo"  ]]; then
    dockerDownCmd="sudo docker-compose down -v --remove-orphans "
  fi
done

echo "${bold}Stopping${normal}"
command="$dockerDownCmd"
echo "${bold}Command: ${command}${normal}"
eval "$command"

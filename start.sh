#!/bin/bash
source .env

bold=$(tput bold)
normal=$(tput sgr0)

# Declare args array
dockerUpCmd="docker-compose"
dockerArgs=()
isSudo=false
dockerServices=(node-backend postgres node-cms node-frontend nginx certbot)
options=""
SSL_INSTALL=false

echo "${bold}Running ...${normal}"

# Copy the env file if doesn't exist
cp -n .env.example .env

# Use options
helpFunction()
{
   echo ""
   echo "Usage: $0 [-d] [-s docker_service(s)] [-o options]"
   echo -e "\t-d docker-compose detach: runs containers in background."
   echo -e "\t-s The name of the docker services to run. If it's left empty, it will use the default dockerServices."
   echo -e "\t-o Options:"
   echo -e "\t\t build \tre-build everything if changes detected."
   echo -e "\t\t ssl \tInstall SSL mode."
   echo -e "\t\t force-i \tForce set FORCE_COMPOSER_INSTALL to true."
   echo -e "\t\t sudo \tRun as superuser."
   echo -e "\t-h Display help"
   exit 1 # Exit script after printing help
}

while getopts ":dhs:o:" opt
do
   case "$opt" in
      d ) isD=true ;;
      s ) dockerServices=($OPTARG) ;;
      o ) options=($OPTARG) ;;
      h ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Apply opt values
# Apply dockerArgs
if [[ $isD = true ]]; then
  dockerArgs+=('-d')
fi

# Check for options
for arg in "${options[@]}"
do
  case "$arg" in
    *build* ) dockerArgs+=('--build') ;;
    *force-i* ) grep -qF 'FORCE_NPM_I' .env || echo 'FORCE_NPM_I=true' >> .env ;;
    *sudo* ) isSudo=true ;;
    *ssl* ) SSL_INSTALL=true ;;
    ? )
      echo "No valid options"
      helpFunction ;;
  esac
done

if [[ $NODE_ENV = "prod" ]] || [[ $NODE_ENV = "production" ]] || [[ $NODE_ENV = "staging" ]]; then
  if [ $SSL_INSTALL = true ]; then
    dockerUpCmd+=" -f docker-compose.yml -f docker-compose.ssl.yml"
  else
    echo "${bold}Running production${normal}"
    # Merge with docker-compose.prod.yml
    dockerUpCmd+=" -f docker-compose.yml -f docker-compose.prod.yml"
  fi
else
  echo "${bold}Running local${normal}"
  # Merge with docker-compose.local.yml
  dockerUpCmd+=" -f docker-compose.yml -f docker-compose.local.yml"
fi

# add 'up' to docker-compose command
dockerUpCmd+=" up"

# Run the main docker-compose command

command="${dockerUpCmd} ${dockerArgs[@]} ${dockerServices[@]}"
# Apply sudo
if [[ "$isSudo" = true ]]; then
    command="sudo ${command}"
fi

# Create docker network if not exist
docker network create vr-wedding_network

echo "${bold}Command: ${command}${normal}"
eval "$command"

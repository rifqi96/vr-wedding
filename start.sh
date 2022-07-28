#!/bin/bash
source .env

bold=$(tput bold)
normal=$(tput sgr0)

# Declare args array
dockerUpCmd="docker-compose"
dockerArgs=()
isSudo=false
dockerServices=(node-backend postgres node-cms node-frontend nginx certbot)

echo "${bold}Running ...${normal}"

# Copy the env file if doesn't exist
cp -n .env.example .env

# Use options
helpFunction()
{
   echo ""
   echo "Usage: $0 [-d] [--build] [--force-i] [-s docker_service(s)]"
   echo -e "\t-d docker-compose detach: runs containers in background."
   echo -e "\t-s The name of the docker services to run. If it's left empty, it will use the default dockerServices."
   echo -e "\t--build re-build everything if changes detected."
   echo -e "\t--force-i Force set FORCE_COMPOSER_INSTALL to true."
   echo -e "\t--ssl-i Install SSL mode."
   echo -e "\t-h Display help"
   exit 1 # Exit script after printing help
}

while getopts ":dhs:" opt
do
   case "$opt" in
      d ) isD=true ;;
      s ) dockerServices=($OPTARG) ;;
      h ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Apply opt values
# Apply dockerArgs
if [[ $isD = true ]]; then
  dockerArgs+=('-d')
fi

if [[ $NODE_ENV = "prod" ]] || [[ $NODE_ENV = "production" ]] || [[ $NODE_ENV = "staging" ]]; then
  echo "${bold}Running production${normal}"
  # Merge with docker-compose.prod.yml
  dockerUpCmd+=" -f docker-compose.yml -f docker-compose.prod.yml"
else
  echo "${bold}Running local${normal}"
  # Merge with docker-compose.local.yml
  dockerUpCmd+=" -f docker-compose.yml -f docker-compose.local.yml"
fi

# Check for additional parameters
for arg in "$@"
do
  # re-build everything if changes detected
  if [[ "$arg" = "--build" ]]; then
    dockerArgs+=('--build')
  # Force set FORCE_NPM_I to true
  elif [ "$arg" == "--npm-i" ] || [[ "$arg" = "--force-i" ]]; then
    grep -qF 'FORCE_NPM_I' .env || echo 'FORCE_NPM_I=true' >> .env
  elif [[ "$arg" = "--sudo" ]]; then
    isSudo=true
  elif [[ "$arg" = "--ssl-i" ]]; then
    export SSL_INSTALL=true
  fi
done

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

bold=$(tput bold)
normal=$(tput sgr0)

# Declare args array
dockerUpCmd="docker-compose"
dockerArgs=()
isSudo=false
dockerServices=(node-backend postgres node-cms node-frontend nginx)

echo "${bold}Running ...${normal}"

# Copy the env file if doesn't exist
cp -n .env.example .env

# Check for additional parameters
for arg in "$@"
do
  # re-build everything if changes detected
  if [[ "$arg" = "--build" ]]; then
    dockerArgs+=('--build')
  # docker-compose detach: runs containers in background
  elif [[ "$arg" = "-d" ]]; then
    dockerArgs+=('-d')
  # Force set FORCE_NPM_I to true
  elif [ "$arg" == "--npm-i" ] || [[ "$arg" = "--force-i" ]]; then
    grep -qF 'FORCE_NPM_I' .env || echo 'FORCE_NPM_I=true' >> .env
  elif [[ "$arg" = "--sudo" ]]; then
    isSudo=true
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

echo "${bold}Requesting certbot ...${normal}"
./init-letsencrypt.sh

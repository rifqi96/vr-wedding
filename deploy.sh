bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}Running ...${normal}"

# Stop containers
echo "${bold}Shutting down containers ...${normal}"
./stop.sh

# Make sure no conflicting files
git stash

# Fetch from the repo
echo "${bold}Fetching from the repo ...${normal}"
git pull origin main

# Start and rebuild containers
echo "${bold}Starting up containers ...${normal}"
./start.sh -d --build

# Auto prune image
yes | npm image prune

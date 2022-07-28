bold=$(tput bold)
normal=$(tput sgr0)

branch="main"
additionalStartOptions=()
dockerServices=""
SSL_INSTALL=false

helpFunction()
{
   echo ""
   echo "Usage: $0 -b branch_name -s docker_service(s)"
   echo -e "\t-b The name of the branch. If it's left empty, it will use 'main' as the default."
   echo -e "\t-s The name of the docker services to run. If it's left empty, it will use the default dockerServices."
   echo -e "\t--ssl-i Install SSL mode."
   exit 1 # Exit script after printing help
}

while getopts ":hb:s:" opt
do
   case "$opt" in
      b ) branch="$OPTARG" ;;
      s ) dockerServices="$OPTARG" ;;
      h ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
# if [ -z "$parameterA" ] || [ -z "$parameterB" ] || [ -z "$parameterC" ]
# then
#    echo "Some or all of the parameters are empty";
#    helpFunction
# fi

# Check for additional parameters
for arg in "$@"
do
  if [[ "$arg" = "--ssl-i" ]]; then
      SSL_INSTALL=true
  fi
done

echo "${bold}Running ...${normal}"

# Stop containers
echo "${bold}Shutting down containers ...${normal}"
./stop.sh

# Make sure no conflicting files
git stash

# Fetch from the repo
echo "${bold}Fetching from $branch ...${normal}"
yes | git pull origin $branch

# Start and rebuild containers
echo "${bold}Starting up containers ...${normal}"
if [ ! -z "$dockerServices" ]; then
   additionalStartOptions+=("-s \"$dockerServices\"")
elif [ SSL_INSTALL = true ]; then
   additionalStartOptions+=("--ssl-i")
fi
startCommand="./start.sh -d --build ${additionalStartOptions[@]}"
echo "${bold}Start command: ${startCommand}${normal}"
eval "$startCommand"

# Auto prune image
yes | docker image prune

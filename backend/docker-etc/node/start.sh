#!/bin/sh
# Run npm install
npm install

# If node_modules folder exists, don't npm ci unless --npm-i option is set
# if [ ! -d "node_modules" ] || [ "$FORCE_NPM_I" == "true" ] ; then
#   npm ci
# fi

pm2-runtime npm -- start

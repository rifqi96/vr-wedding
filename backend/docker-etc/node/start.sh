#!/bin/sh
# Run npm install
npm install

# If node_modules folder exists, don't npm ci unless --npm-i option is set
# if [ ! -d "node_modules" ] || [ "$FORCE_NPM_I" == "true" ] ; then
#   npm ci
# fi

if [ "$APP_ENV" = "production" ]; then
  pm2-runtime npm -- start --omit=dev
else
  pm2-runtime npm -- start
fi

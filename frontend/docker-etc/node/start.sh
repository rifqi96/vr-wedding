# Tail node
# tail -f /dev/null
# Temp fix for eslint error
export SKIP_PREFLIGHT_CHECK=true

# Run server
if [ "$NODE_ENV" = "production" ]; then
  # Run npm install
  npm install --omit=dev
  npm run build
  npm install -location=global serve
  serve -s build -l 3000
else
  # Run npm install
  npm install
  npm install --location=global pm2
  pm2-runtime npm -- start
fi

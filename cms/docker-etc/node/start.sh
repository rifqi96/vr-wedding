# Run npm install
npm install

# Tail node
# tail -f /dev/null

# Run server
if [ "$NODE_ENV" = "production" ]; then
  npm run build
  npm install -location=global serve
  serve -s build -l 3000
else
  npm install --location=global pm2
  pm2-runtime npm -- start
fi

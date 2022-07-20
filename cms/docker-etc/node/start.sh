# Run npm install
npm install

# Tail node
# tail -f /dev/null

# Run
if [ "$NODE_ENV" = "production" ]; then
  npm run build
  npm install -g serve
  pm2-runtime serve -s build -l 3000
else
  pm2-runtime npm -- start
fi

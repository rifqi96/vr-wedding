# Run npm install
npm install

# Tail node
# tail -f /dev/null

# Run next
if [ "$APP_ENV" = "production" ]; then
  npm run build
  pm2-runtime npm -- start
else
  pm2-runtime npm -- start
fi

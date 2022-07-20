# Run npm install
npm install

# Tail node
# tail -f /dev/null

# Run next
if [ "$NODE_ENV" = "production" ]; then
  # npm run build
  pm2-runtime npm -- start --omit=dev
else
  pm2-runtime npm -- start
fi

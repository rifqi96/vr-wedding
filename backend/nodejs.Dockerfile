FROM node:16.16-alpine3.15

ARG NODE_ENV=${NODE_ENV}

ENV NODE_ENV ${NODE_ENV}
ENV USER www
ENV USERDIR /var/${USER}
ENV WORKDIR ${USERDIR}
ENV ETCDIR ./docker-etc/node

# Set current workdir
WORKDIR ${WORKDIR}

# Copy the start script to the container
COPY ${ETCDIR}/start.sh /var/scripts/
RUN chmod +x /var/scripts/start.sh

# Copy the app source
ADD ./ ./

# Install PM2 globally
RUN npm install --global pm2

# Expose nodejs ports
EXPOSE 3000 9229
# Run the start script
CMD ["sh", "-c", "/var/scripts/start.sh"]
FROM node:16.16-alpine3.15

ENV PORT 3000
ENV WORKDIR /var/www
ENV ETCDIR ./docker-etc/node

# Set the default working folder
WORKDIR ${WORKDIR}

# Install required apk packages
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    bash curl

# Copy all files
ADD ./ ./

# Install PM2 globally
RUN npm install --location=global pm2

# Copy start.sh script
COPY ${ETCDIR}/start.sh /var/scripts/start.sh
RUN chmod +x /var/scripts/start.sh

EXPOSE ${PORT}

CMD ["bash", "-c", "/var/scripts/start.sh"]

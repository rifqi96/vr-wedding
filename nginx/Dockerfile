FROM nginx:1.23.1-alpine

ARG ENVIRONMENT=${NODE_ENV}

ENV PORT 80
ENV ENVIRONMENT ${NODE_ENV}
ENV WORKDIR /var/www
ENV ETCDIR .
ENV CONFDIR ${ETCDIR}/conf.d

WORKDIR ${WORKDIR}

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    bash

COPY ${CONFDIR}/*.conf /etc/nginx/conf.d/

# Create nginx log dir
RUN mkdir -p /var/log/nginx

# Override the default.conf nginx file
# RUN if [ "$ENVIRONMENT" = "production" ] || [ "$ENVIRONMENT" = "staging" ]; \
#         then cp ${CONFTEMPLDIR}/default.conf ${CONFDIR}/default.conf; \
#     else \
#         cp ${CONFTEMPLDIR}/default.local.conf ${CONFDIR}/default.conf; \
#     fi

EXPOSE ${PORT}

CMD ["nginx", "-g", "daemon off;"]

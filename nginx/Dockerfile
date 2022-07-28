FROM nginx:1.23.1-alpine

ARG ENVIRONMENT=${ENVIRONMENT}
ARG SSL_INSTALL=${SSL_INSTALL}

ENV PORT 80
ENV ENVIRONMENT ${ENVIRONMENT}
ENV SSL_INSTALL ${SSL_INSTALL}
ENV WORKDIR /var/www
ENV ETCDIR .
ENV CONFDIR /etc/nginx/conf.d
ENV CONFTMPLDIR /etc/nginx/conf-template.d

WORKDIR ${WORKDIR}

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    bash

RUN mkdir ${CONFTMPLDIR}
ADD ${ETCDIR}/conf.d/* ${CONFTMPLDIR}/

# Create nginx log dir
RUN mkdir -p /var/log/nginx

# Clear default conf.d content
RUN rm -rf ${CONFDIR}/*

# Override the default.conf nginx file
RUN if [[ $SSL_INSTALL = true ]]; then \
        cp ${CONFTMPLDIR}/*.temp.conf ${CONFDIR}/ ;\
    elif [[ $ENVIRONMENT = "production" ]] || [[ $ENVIRONMENT = "staging" ]]; then \
        cp ${CONFTMPLDIR}/* ${CONFDIR}/ && \
        rm -rf ${CONFDIR}/*.local.conf ;\
    else \
        cp ${CONFTMPLDIR}/*.local.conf ${CONFDIR}/ ;\
    fi

# Clear unused conf files
# RUN rm -rf ${CONFTMPLDIR}

EXPOSE ${PORT}

CMD ["nginx", "-g", "daemon off;"]

FROM nginx:1.23.1-alpine as builder

ENV PORT 80
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

FROM builder as ssl

RUN cp ${CONFTMPLDIR}/*.temp.conf ${CONFDIR}/

EXPOSE ${PORT}

CMD ["nginx", "-g", "daemon off;"]

FROM builder as prod

RUN cp ${CONFTMPLDIR}/* ${CONFDIR}/ && \
    rm -rf ${CONFDIR}/*.local.conf

EXPOSE ${PORT}

CMD ["nginx", "-g", "daemon off;"]

FROM builder as local

RUN cp ${CONFTMPLDIR}/*.local.conf ${CONFDIR}/

EXPOSE ${PORT}

CMD ["nginx", "-g", "daemon off;"]

FROM node:20-alpine AS base

LABEL org.opencontainers.image.source="https://github.com/dongten/containers"

RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

CMD ["/app/run.sh", "/app/src", "/app/out", "/app/builds", "${NODE_ENV}"]
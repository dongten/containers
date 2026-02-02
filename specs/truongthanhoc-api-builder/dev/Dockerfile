FROM node:20-alpine

LABEL org.opencontainers.image.source="https://github.com/dongten/containers"

RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh", "/src", "/app", "/builds"]
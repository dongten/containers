FROM node:20-alpine AS base

RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
ENV PATH=/app/node_modules/.bin:$PATH

VOLUME ["/app"]

WORKDIR /app

EXPOSE 1337

CMD ["npm", "run", "start"]

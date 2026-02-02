FROM node:20-alpine AS base

LABEL org.opencontainers.image.source="https://github.com/dongten/containers"

RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
ENV PATH=/app/node_modules/.bin:$PATH

ENV TZ="Asia/Ho_Chi_Minh"
ENV HOST="0.0.0.0"
ENV PORT="1337"
ENV APP_KEYS="toBeModified1,toBeModified2"
ENV API_TOKEN_SALT="toBeModified"
ENV ADMIN_JWT_SECRET="toBeModified"
ENV TRANSFER_TOKEN_SALT="toBeModified"
ENV ENCRYPTION_KEY="toBeModified"
ENV DATABASE_CLIENT="postgres"
ENV DATABASE_HOST=""
ENV DATABASE_PORT="6543"
ENV DATABASE_NAME="tobeModified"
ENV DATABASE_USERNAME="tobeModified"
ENV DATABASE_PASSWORD="tobeModified"
ENV DATABASE_SSL="true"
ENV JWT_SECRET="tobeModified"
ENV CLOUDINARY_NAME="tobeModified"
ENV CLOUDINARY_KEY="tobeModified"
ENV CLOUDINARY_SECRET="tobeModified"

VOLUME ["/app"]

WORKDIR /app

EXPOSE 1337

CMD ["npm", "run", "start"]

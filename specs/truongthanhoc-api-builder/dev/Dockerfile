FROM node:20-alpine AS base

RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /opt/
COPY package.json package-lock.json ./
RUN npm install -g node-gyp
RUN npm config set fetch-retry-maxtimeout 600000 -g && npm install --only=production
ENV PATH=/opt/node_modules/.bin:$PATH

WORKDIR /opt/app
COPY . .

# Build the app
FROM base AS build
RUN npm install --only=development
RUN npm run build

# Creating final production image
FROM base AS runner
COPY --from=build /opt/app/dist ./dist

# Strapi needs these environment variables at runtime, but they can also be passed via docker run --env-file
# We expose the port
EXPOSE 1337

CMD ["npm", "run", "start"]

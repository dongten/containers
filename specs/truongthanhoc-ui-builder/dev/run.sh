#!/bin/sh


APP_SOURCE=${1:-/src}
APP_OUTPUT=${2:-/dist}

export PATH=$PATH:$APP_BUILD/node_modules/.bin

# mkdir if not exists
mkdir -p $APP_OUTPUT

npm config set fetch-retry-maxtimeout 600000 -g
npm install
npm run build

exit 0
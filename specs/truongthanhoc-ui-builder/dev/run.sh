#!/bin/sh


APP_SOURCE=${1:-/src}
APP_OUTPUT=${2:-/dist}

# mkdir if not exists
mkdir -p $APP_OUTPUT

npm config set fetch-retry-maxtimeout 600000 -g
npm install

export PATH=$PATH:$APP_OUTPUT/node_modules/.bin
next build

exit 0
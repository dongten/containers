#!/bin/sh


APP_SOURCE=${1:-/in}
APP_OUTPUT=${2:-/out}
APP_BUILD=${3:-/app}

export PATH=$PATH:$APP_BUILD/node_modules/.bin

# mkdir if not exists
mkdir -p $APP_BUILD
mkdir -p $APP_OUTPUT

cp -r $APP_SOURCE/* $APP_BUILD

cd $APP_BUILD

npm install -g node-gyp
npm config set fetch-retry-maxtimeout 600000 -g && npm install --only=production
npm run build

cp -r $APP_BUILD/dist/* $APP_OUTPUT

exit 0
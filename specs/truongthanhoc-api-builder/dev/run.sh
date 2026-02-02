#!/bin/sh


APP_SOURCE=${1:-/src}
APP_OUTPUT=${2:-/app}
APP_BUILD=${3:-/builds}

export PATH=$PATH:$APP_BUILD/node_modules/.bin

cp $APP_SOURCE/* $APP_BUILD

cd $APP_BUILD

npm install -g node-gyp
npm config set fetch-retry-maxtimeout 600000 -g && npm install --only=production
npm run build

cp -r $APP_BUILD/out/* $APP_OUTPUT

exit 0
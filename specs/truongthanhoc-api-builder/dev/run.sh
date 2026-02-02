#!/bin/sh


SOURCE=${1:-/src}
OUTPUT=${2:-/app}
BUILD=${3:-/builds}

export PATH=$PATH:$BUILD/node_modules/.bin

cp $SOURCE/* $BUILD

cd $BUILD

npm install -g node-gyp
npm config set fetch-retry-maxtimeout 600000 -g && npm install --only=production
npm run build

cp -r $BUILD/out/* $OUTPUT

exit 0
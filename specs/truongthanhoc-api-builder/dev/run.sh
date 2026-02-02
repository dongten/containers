#!/bin/sh

SOURCE=$1
OUTPUT=$2
BUILD=${3:-false}

export PATH=$PATH:$BUILD/node_modules/.bin

cp $SOURCE/* $BUILD

cd $BUILD

npm install -g node-gyp
npm config set fetch-retry-maxtimeout 600000 -g && npm install --only=production
npm run build

cp -r $BUILD/out/* $OUTPUT

exit 0
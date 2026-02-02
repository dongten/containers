#!/bin/sh

SOURCE=$1
OUTPUT=$2
BUILD=${3:-false}

export PATH=$PATH:$OUTPUT/node_modules/.bin

cd $SOURCE
cp $SOURCE/package.json $OUTPUT
cp $SOURCE/package-lock.json $OUTPUT

cd $OUTPUT
npm install -g node-gyp
npm config set fetch-retry-maxtimeout 600000 -g && npm install --only=production

cp -r $SOURCE/* $BUILD

cd $BUILD
npm run build

cp -r $BUILD/dist $SOURCE/dist

exit 0
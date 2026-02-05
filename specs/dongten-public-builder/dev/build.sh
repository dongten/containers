#!/bin/bash

# read params
SOURCE=$1
DEST=$2

mkdir -p $DEST

# Copy package files
cp -R $SOURCE/package*.json $DEST

cd $DEST

# Install dependencies
npm install --legacy-peer-deps

# Copy application files
cp -R $SOURCE/* .

# Build
npm run build

# Copy build output to destination
cp -R dist/* $DEST
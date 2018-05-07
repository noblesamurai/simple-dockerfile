#!/usr/bin/env bash
set -e
DIR=`pwd`
cd ./test/fixtures/noAptfile
npm link ../../..
npx install-dockerfile
docker build .
rm Dockerfile
cd $DIR

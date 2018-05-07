#!/usr/bin/env bash
$DIR=`pwd`
cd ./test/fixtures/noAptfile
npx install-dockerfile
docker build .
rm Dockerfile
cd $DIR

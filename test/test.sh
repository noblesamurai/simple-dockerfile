#!/usr/bin/env bash
pwd
cd ./test/fixtures/noAptfile
npx install-dockerfile
docker build .

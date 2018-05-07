# This Dockerfile was installed with the npm package simple-dockerfile.
# Changing it may result in conflicts with updates, so just be aware and use git.
FROM node:8
ENV NPM_CONFIG_LOGLEVEL warn

# Create app directory
WORKDIR /code

# HACK: The wildcard is on Aptfile* and .npmrc* so they can be optional
# (otherwise docker won't build if they are missing).
# package*.json will capture package-lock.json as well.
COPY Aptfile* .npmrc* package*.json ./

RUN if [ -f Aptfile ]; then apt-get update && apt-get install -y `cat Aptfile`; fi
RUN npm install

ADD . ./
CMD npm run docker

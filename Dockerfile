# This Dockerfile was installed with the npm package simple-dockerfile.
# Changing it may result in conflicts with updates, so just be aware and use git.
FROM node:8
ENV NPM_CONFIG_LOGLEVEL warn

# Create app directory
WORKDIR /code

# HACK: The wildcard is on .npmrc* so it can be optional
# (otherwise docker won't build if it is missing).
COPY Aptfile .npmrc* ./
RUN if [ -f Aptfile ]; then apt-get update && apt-get install -y `cat Aptfile`; fi

# package*.json will capture package-lock.json as well.
COPY package*.json ./
RUN npm install

ADD . ./
CMD npm run docker

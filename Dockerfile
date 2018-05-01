# This Dockerfile was installed with the npm package simple-dockerfile.
# Changing it may result in conflicts with updates, so just be aware and use git.
FROM node:8
ENV NPM_CONFIG_LOGLEVEL warn

# Create app directory
WORKDIR /usr/src/app

COPY Aptfile ./
RUN apt-get update && apt-get install -y `cat Aptfile`

COPY package*.json ./
ADD .npmrc ./
RUN npm install

ADD . ./
CMD npm run docker

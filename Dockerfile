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

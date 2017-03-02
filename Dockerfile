FROM node:7.7.0

# node-gyp (dep) needs a compiler
RUN apt-get install g++

# This is straight from https://github.com/nodejs/docker-node/blob/master/7.7/onbuild/Dockerfile
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD ARG NODE_ENV
ONBUILD ENV NODE_ENV $NODE_ENV
ONBUILD COPY package.json /usr/src/app/
ONBUILD RUN npm install && npm cache clean
ONBUILD COPY . /usr/src/app

EXPOSE 8000

CMD [ "npm", "start" ]

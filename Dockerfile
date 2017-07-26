FROM node:latest

WORKDIR /webapp

RUN apt-get update && apt-get install -y curl apt-transport-https && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

RUN yarn global add elm webpack webpack-dev-server

ADD package.json yarn.lock ./
ADD elm-package.json ./
ADD webpack.config.js ./

RUN yarn install
RUN elm-package install -y

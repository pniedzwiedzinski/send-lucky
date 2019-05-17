FROM node:lts-stretch-slim

RUN apt-get update && apt-get install git -y \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN npm install -g messer

ADD . /usr/local/bin

WORKDIR /home





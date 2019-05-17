FROM node:lts-stretch-slim

RUN apt-get update && apt-get install git -y
RUN npm install -g messer

ADD . /usr/local/bin

WORKDIR /home





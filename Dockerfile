FROM node:lts-stretch-slim

RUN apt-get update && apt-get install git -y
RUN npm install -g messer

ADD ./send_lucky_number.sh /usr/local/bin

WORKDIR /home
RUN chmod +x /usr/local/bin/send_lucky_number.sh





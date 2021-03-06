FROM alpine:3.9

RUN apk add --no-cache nodejs nodejs-npm git \
    && rm -rf /var/cache/apk/*

WORKDIR /home

COPY package.json .

RUN npm install && \
    chmod +x node_modules/messer/index.js && \
    ln node_modules/messer/index.js /usr/local/bin/messer && \
    rm package-lock.json

RUN apk del nodejs-npm git

ADD . /home

CMD [ "./send_lucky_number.js" ]

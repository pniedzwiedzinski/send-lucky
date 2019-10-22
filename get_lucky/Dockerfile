FROM zenika/alpine-chrome

USER root

RUN echo @edge http://nl.alpinelinux.org/alpine/edge/community > /etc/apk/repositories \
    && echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories \
    && apk add --no-cache \
    python3@edge \
    chromium-chromedriver@edge \
    curl@edge \
    && rm -rf /var/cache/* \
    && mkdir /var/cache/apk

WORKDIR /home

COPY requirements.txt .

RUN python3 -m pip install -r requirements.txt

ADD . /home

ENTRYPOINT [ "./docker_entrypoint.sh" ]

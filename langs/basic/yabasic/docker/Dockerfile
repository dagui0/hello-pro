FROM debian:trixie-slim

LABEL maintainer="hello-pro project"

ENV LANG=C.UTF-8
ENV USER=hellopro
ENV UID=1000
ENV GID=1000

RUN apt-get update && \
    apt-get install -y yabasic locales gosu && \
    (cd /usr/bin; ln -s yabasic basic) && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "daemon" ]

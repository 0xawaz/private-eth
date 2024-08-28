# Build Stage
FROM ethereum/client-go:alltools-v1.14.8

LABEL maintainer="Amina Waddiz (@0xawaz)"

ARG UID=1001
ARG GID=1001

ENV GETH_VERSION=1.14.8
ENV GETH_DATA=/home/ethereum/.ethereum

RUN apk update && \
    apk add --no-cache shadow && \
    groupadd --gid ${GID} ethereum && \
    useradd --create-home --no-log-init -u ${UID} -g ${GID} ethereum && \
    apk cache clean && rm -rf /tmp/* /var/tmp/*

WORKDIR /home/ethereum

COPY config/genesis.json $GETH_DATA/

COPY scripts/start-geth.sh .
RUN chown ethereum:ethereum "./start-geth.sh" && \
    chmod +x ./start-geth.sh

USER ethereum

VOLUME ["$GETH_DATA"]

EXPOSE 8545 30303

ENTRYPOINT ["/home/ethereum/start-geth.sh"]
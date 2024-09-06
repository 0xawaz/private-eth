# Build Stage
FROM ethereum/client-go:alltools-v1.14.8

LABEL maintainer="Amina (@0xawaz)"

ARG UID=1001
ARG GID=1001

RUN apk update && \
    apk add --no-cache shadow curl && \
    mkdir -p /execution && \
    groupadd --gid ${GID} ethereum && \
    useradd --create-home --no-log-init -u ${UID} -g ${GID} ethereum && \
    apk cache clean && rm -rf /tmp/* /var/tmp/*

COPY config/execution/ /execution/

RUN chmod 600 /execution/jwt.hex /execution/geth_pass

VOLUME ["/execution"]

EXPOSE 8551 8545 8546 30303

ENTRYPOINT ["geth"]
# Build Stage
FROM ethereum/client-go:alltools-v1.14.8

LABEL maintainer="Amina (@0xawaz)"

ARG UID=1001
ARG GID=1001

RUN apk update && \
    apk add --no-cache shadow curl && \
    mkdir -p /execution /consensus && \
    groupadd --gid ${GID} ethereum && \
    useradd --create-home --no-log-init -u ${UID} -g ${GID} ethereum && \
    apk cache clean && rm -rf /tmp/* /var/tmp/*

# COPY config/jwt.hex /execution/

# COPY config/geth_pass /execution/

# RUN chmod 600 /execution/jwt.hex  && \
#     chmod 600 /execution/geth_pass

# USER ethereum

VOLUME ["/execution", "/consensus"]

EXPOSE 8545 30303

ENTRYPOINT ["geth"]
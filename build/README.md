# Build Docker Image

## Install binaries

Make sure you have docker and docker-compose [installed](https://docs.docker.com/engine/install/).

If you need an ansible role for docker, please check [here](https://github.com/0xawaz/awaz-penumbra-testnet/blob/main/infra/roles/docker/tasks/main.yml).

## Quickstart

Please follow these steps to get setup a private ethereum network locally:

```sh
# get project
git clone git@github.com:0xawaz/private-eth.git
cd private-eth/build

# create local data dir
mkdir -p data/{execution,consensus}

# run program
docker-compose up -d

# check logs
docker logs -f execution-0
docker logs -f beacon
docker logs -f validator-0

# cleanup
docker-compose down
```

## Build and Push Docker image

Our docker image is built and pushed to regitry using github workflows.

## Future Work

* Use a Multistage Dockerfile
* Add advanced settings to the Dockerfile
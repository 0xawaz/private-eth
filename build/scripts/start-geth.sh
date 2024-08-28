#!/bin/sh
set -e

# ENV vars
GETH_DATA=/home/ethereum/.ethereum

# Bootstrap node with Genesis block
geth init $GETH_DATA/genesis.json

# Start the Geth client
geth --datadir $GETH_DATA --networkid 939 --port 30303 --http \
     --http.addr 0.0.0.0 --http.port 8545 --http.corsdomain "*" \
     --http.vhosts "*" --nodiscover --syncmode 'full' --verbosity 3

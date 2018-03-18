#!/bin/bash

docker stop magnetwork-masternode;
docker rm magnetwork-masternode;

docker run \
  --name magnetwork-masternode \
  --net=host \
  -d \
  karstenjakobsen/magnetwork-masternode:1.3.0
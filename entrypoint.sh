#!/bin/bash

# Lets go for takeoff
ulimit -m unlimited
ulimit -v unlimited
ulimit -n 65536

cp /tmp/.magnet/* /root/.magnet/

exec magnetd -conf=/root/.magnet/magnet.conf
# -conf=/root/.magnet/magnet.conf

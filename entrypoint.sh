#!/bin/bash

# Lets go for takeoff
ulimit -m unlimited
ulimit -v unlimited
ulimit -n 65536

exec magnetd -conf=/root/.magnet/magnet.conf -printtoconsole
# -conf=/root/.magnet/magnet.conf
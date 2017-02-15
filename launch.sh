#!/bin/bash

set -ex

cat /etc/passwd > /tmp/passwd
echo "$(id -u):x:$(id -u):$(id -g):dynamic uid:$PWD:/bin/false" >> /tmp/passwd

export NSS_WRAPPER_PASSWD=/tmp/passwd
export NSS_WRAPPER_GROUP=/etc/group

export LD_PRELOAD=libnss_wrapper.so

export MASTER=$SPARK_MASTER_ADDRESS

exec /opt/zeppelin/bin/zeppelin.sh

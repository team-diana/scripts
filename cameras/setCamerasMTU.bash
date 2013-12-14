#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage:"
  echo "$0 mtu"
  exit -1
fi

mtu=$1
echo "Setting the mtu to $mtu"
sudo ifconfig eth1 mtu $mtu

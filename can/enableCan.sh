#!/bin/bash
source $DIANA_SCRIPTS_DIR/utils/utils.sh

enable=$1


help() {
  echo "$0 [on|off]"
}

if [[ $enable == "on" ]]; then
  sudo modprobe sja1000
  sudo modprobe can_dev
  sudo modprobe plx_pci
elif [[ $enable == "off" ]]; then
  sudo modprobe -r plx_pci
  sudo modprobe -r sja1000
  sudo modprobe -r can_dev
else
  help
  exit -1
fi


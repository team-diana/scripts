#!/bin/bash

echo "Starting building p7432 and p9116 modules"

cd ~/Downloads/driver/p7432_linux30/p7432_linux30_drvsrc/drvsrc_udev/pci7432
make
cd ~/Downloads/driver/p7432_linux30/p7432_linux30_drvsrc/drivers/$(uname -r)
sudo cp p7432.ko /lib/modules/$(uname -r)/kernel/lib/

echo
echo "p7432 built"
echo

cd ~/Downloads/driver/p9116_linux30/p9116_linux30_drvsrc/drvsrc_udev/allocator
make
cd ~/Downloads/driver/p9116_linux30/p9116_linux30_drvsrc/drvsrc_udev/pci9116
make
cd /home/diana/Downloads/driver/p9116_linux30/p9116_linux30_drvsrc/drivers/$(uname -r)
sudo cp  adl_mem_mgr.ko   p9116.ko  /lib/modules/$(uname -r)/kernel/lib/

echo
echo "p9116 built"
echo

echo "Loading modules..."
sudo depmod
sudo modprobe p9116
sudo modprobe p7432

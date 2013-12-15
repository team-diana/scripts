echo "This will install drivers and other stuff"

echo "untar all the tars"
for tar in $(ls); do
  tar -xvf $tar
done

cd flycapture2-2.5.3.4-amd64
bash install_flycapture.sh
cd ..

cd p7432_linux30_drvsrc/drvsrc_udev/pci7432
make
cd ../..
sudo perl dask_inst.pl
cd ..

cd p9116_linux30_drvsrc/drvsrc_udev/pci9116
make
cd ../..
sudo perl dask_inst.pl
cd ..

echo "Driver installed"

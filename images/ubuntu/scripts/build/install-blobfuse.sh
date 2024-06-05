#!/bin/bash -e
################################################################################
##  File:  install-blobfuse.sh
##  Desc:  Install Blob Fuse to mount the cache
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/install.sh

cache_temp_folder="/var/cache/build-temp"
azfiles_root_folder="/azfiles"

wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get -y --no-install-recommends install blobfuse
sudo apt-get install libfuse2


sudo mkdir "${cache_temp_folder}"
echo "Assign Permissions to all"
sudo chmod -R 777 "${cache_temp_folder}"


sudo mkdir -p "${azfiles_root_folder}/azcreds"
sudo chmod -R 777 "${azfiles_root_folder}/azcreds"

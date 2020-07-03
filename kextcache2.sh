#/bin/sh

sudo mount -uw /
sudo chown -R 0:0 /S*/L*/E*/
sudo chmod -R 755 /S*/L*/E*/
sudo chown -R 0:0 /L*/E*/
sudo chmod -R 755 /L*/E*/
cd /System/Library/Filesystems/apfs.fs/Contents/Resources/
sudo ./apfs_boot_util 1 
sudo ./apfs_boot_util 2
sudo kextcache -i /
sudo kmutil install --update-all
sudo kcditto


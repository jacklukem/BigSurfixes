#/bin/sh

mount -uw /
chown -R 0:0 /System/Library/Extensions/
chmod -R 755 /System/Library/Extensions/
/System/Library/Filesystems/apfs.fs/Contents/Resources/apfs_boot_util 1
/System/Library/Filesystems/apfs.fs/Contents/Resources/apfs_boot_util 2
kextcache -i /
kmutil install --update-all
kcditto

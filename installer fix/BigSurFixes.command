#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\033[1;38;5;51m;%s\a' "$color"

printf "$'\e[40m'BigSurFixes beta by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the BigSurFixes beta\nthis version should fix booting without nvram compat_check and opencore, telemetry kp for Penryn Core2Duo cpus and also attempt to fix mount -uw /"
echo "\nSetting nvram and csrutil parameter to enforce compatibility check"
nvram boot-args="-no_compat_check"
csrutil disable
csrutil authenticated-root disable
echo "\nDone\n"
printf '\033[1;38;5;226m'
echo "\nDetecting and adjusting BigSur APFS Preboot\n"
diskutil list | grep Preboot
echo "\n(if you have multiple Preboot type the diskXsY with largest MB size)\n" 
read -p "Type your diskXsY (for example disk3s2) BigSur APFS Volume label -> " prelabel
diskutil mount $prelabel
if [ -e /Volumes/Preboot/*/boot/System/Library/KernelCollections/ ]
then
mount -uw /Volumes/Preboot*
cd /Volumes/Preboot/*/boot/System/Library/KernelCollections/
cd .. ; cd .. ; cd .. ; cd ..
cd System/Library/CoreServices/
mv PlatformSupport.plist PlatformSupport.plist2
echo "\nDone\n"
printf '\033[1;38;5;46m'
echo "\nListing available mounted disks\n"
ls /Volumes
echo "\n"
read -p "Type your BigSur Volume label -> " label  
echo "\n\nFixing telemetry plugin for BigSur APFS System"
mount -uw /Volumes/"$label"
cd /Volumes/$label/System/Library/KernelCollections/
cd .. 
cd UserEventPlugins
mv com.apple.telemetry.plugin com.apple.telemetry.plugin2
echo "\nDone"
printf "\033[1;38;5;218m"
echo "\n\nAttempting to fix mount -uw / for BigSur APFS System"
cd .. ; cd .. ; cd .. 
/S*/L*/File*/apfs*/C*/R*/apfs_systemsnapshot -v . -r ""
echo "\nDone"
echo "\n\nAfter reboot your BigSur should boot without opencore , Penryn Core2Duo and maybe with working mount -uw /\n"
elif [ -e /System/Volumes/Preboot/*/boot/System/Library/KernelCollections/ ]
then
cd /System/Volumes/Preboot/*/boot/System/Library/KernelCollections/
cd .. ; cd .. ; cd .. ; cd ..
cd System/Library/CoreServices/
mv PlatformSupport.plist PlatformSupport.plist2
echo "Done"
echo "\nAfter reboot your BigSur should boot without opencore , Penryn Core2Duo and maybe with working mount -uw /\n"
else
echo "\nWarning: you have multiple separate APFS containers to find your correct BigSur APFS Preboot type:\n\ndiskutil unmount Preboot\ndiskutil list | grep Preboot\n(select the largest MB Preboot and mount)\ndiskutil list | grep Preboot\ndiskutil mount diskXsY\n\nafter mounted diskXsY relaunch the fix\n\n"
diskutil list | grep Preboot
fi

#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\e[96m;%s\a' "$color"

printf "$'\e[40m'BigSur beta 1 prelinkedkernel fix by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the BigSur beta 1 prelinkedkernel AirDrop fix\nthis version applies also a patched prelinkedkernel for beta1 to include telemetry fix, legacy usb and maybe also sound and wifi"
echo "\nBigSur prelinkedkernel fix can't be executed as standard user if you want to suspend the script just press CTRL+Z"
echo "\nto apply this fix your current account password is required\notherwise the script can't process\n"
echo "\nSetting nvram parameter to enforce compatibility check"
sudo nvram boot-args="-no_compat_check"
echo "Done"
echo "\nDetecting and adjusting BigSur APFS Preboot"
diskutil mount Preboot
if [ -e /System/Volumes/Preboot/*/boot/System/Library/KernelCollections/ ]
then
curl https://github.com/jacklukem/BigSurfixes/raw/master/prelinkedkernel%20fix/com.apple.Boot.plist --progress-bar -L -o /private/tmp/com.apple.Boot.plist
curl https://github.com/jacklukem/BigSurfixes/raw/master/patched%20prelinkedkernel%20beta1/patched%20prelinkedkernel%20Wifi%20AirDrop%20beta1/prelinkedkernel --progress-bar -L -o /private/tmp/prelinkedkernel
cd /System/Volumes/Preboot/*/boot/System/Library/KernelCollections/
cd .. ; cd .. ; cd .. ; cd ..
cd System/Library/CoreServices/
sudo mv PlatformSupport.plist PlatformSupport.plist2
sudo cp -a /private/tmp/com.apple.Boot.plist .
cd ..
cd PrelinkedKernels
sudo cp -a /private/tmp/prelinkedkernel .
echo "Done"
echo "\nAfter reboot your BigSur should use the prelinkedkernel instead of BootKernelExtensions.kc\n and AirDrop channel should work\n"
else
echo "\nWarning: you have multiple separate APFS containers to find your correct BigSur APFS Preboot type:\n\ndiskutil unmount Preboot\ndiskutil list | grep Preboot\n(select the largest MB Preboot and mount)\ndiskutil mount diskXsY\n\n"
fi

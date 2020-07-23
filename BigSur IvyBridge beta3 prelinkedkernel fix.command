#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\e[96m;%s\a' "$color"

printf "$'\e[40m'BigSur beta 3 Ivy Bridge prelinkedkernel fix by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the BigSur beta 3 Ivy Bridge prelinkedkernel Sound, Wifi, AirDrop fix\nthis version does not include telemetry fix, legacy usb fixes"
echo "\nBigSur prelinkedkernel fix can't be executed as standard user if you want to suspend the script just press CTRL+Z"
echo "\nto apply this fix your current account password is required\notherwise the script can't process\n"
echo "\nSetting nvram parameter to enforce compatibility check"
sudo nvram boot-args="-no_compat_check"
echo "Done"
echo "\nDetecting and adjusting BigSur APFS Preboot"
diskutil mount Preboot
if [ -e /Volumes/Preboot/*/boot/System/Library/KernelCollections/ ]
then
curl https://github.com/jacklukem/BigSurfixes/raw/master/prelinkedkernel%20fix/com.apple.Boot.plist --progress-bar -L -o /private/tmp/com.apple.Boot.plist
curl https://github.com/jacklukem/BigSurfixes/blob/master/patched%20prelinkedkernel/prelinkedkernelb3ivybridge.zip?raw=true --progress-bar -L -o /private/tmp/prelinkedkernel.zip
cd /Volumes/Preboot/*/boot/System/Library/KernelCollections/
cd .. ; cd .. ; cd .. ; cd ..
cd System/Library/CoreServices/
sudo mv PlatformSupport.plist PlatformSupport.plist2
sudo cp -a /private/tmp/com.apple.Boot.plist .
cd ..
cd PrelinkedKernels
sudo unzip /private/tmp/prelinkedkernel.zip -d .
echo "Done"
echo "\nAfter reboot your BigSur should use the prelinkedkernel instead of BootKernelExtensions.kc\n and Sound, Wifi and AirDrop channel should work\n"
elif [ -e /System/Volumes/Preboot/*/boot/System/Library/KernelCollections/ ]
then
curl https://github.com/jacklukem/BigSurfixes/raw/master/prelinkedkernel%20fix/com.apple.Boot.plist --progress-bar -L -o /private/tmp/com.apple.Boot.plist
curl https://github.com/jacklukem/BigSurfixes/blob/master/patched%20prelinkedkernel/prelinkedkernelb3ivybridge.zip?raw=true --progress-bar -L -o /private/tmp/prelinkedkernel.zip
cd /System/Volumes/Preboot/*/boot/System/Library/KernelCollections/
cd .. ; cd .. ; cd .. ; cd ..
cd System/Library/CoreServices/
sudo mv PlatformSupport.plist PlatformSupport.plist2
sudo cp -a /private/tmp/com.apple.Boot.plist .
cd ..
cd PrelinkedKernels
sudo unzip /private/tmp/prelinkedkernel.zip -d .
echo "Done"
echo "\nAfter reboot your BigSur should use the prelinkedkernel instead of BootKernelExtensions.kc\n and Sound, Wifi and AirDrop channel should work\n"
else
echo "\nWarning: you have multiple separate APFS containers to find your correct BigSur APFS Preboot type:\n\ndiskutil unmount Preboot\ndiskutil list | grep Preboot\n(select the largest MB Preboot and mount)\ndiskutil list | grep Preboot\ndiskutil mount diskXsY\n\nafter mounted diskXsY relaunch the fix\n\nNote to run directly from BigSur an ethernet internet connection is required\n"
diskutil list | grep Preboot
fi

#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\e[96m;%s\a' "$color"

printf "$'\e[40m'BigSur generic BKE fix by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the BigSur generic BKE fix this version removes my prelinkedkernel fix patch"
echo "\nBigSur prelinkedkernel fix can't be executed as standard user if you want to suspend the script just press CTRL+Z"
echo "\nto apply this fix your current account password is required\notherwise the script can't process\n"
echo "\nSetting nvram parameter to enforce compatibility check"
sudo nvram boot-args="-no_compat_check"
echo "Done"
echo "\nDetecting and adjusting BigSur APFS Preboot"
diskutil mount Preboot
if [ -e /Volumes/Preboot/*/boot/System/Library/KernelCollections/ ]
then
cd /Volumes/Preboot/*/boot/System/Library/KernelCollections/
cd .. ; cd .. ; cd .. ; cd ..
cd System/Library/CoreServices/
sudo mv PlatformSupport.plist PlatformSupport.plist2
sudo mv com.apple.Boot.plist com.apple.Boot.plist2
cd ..
cd PrelinkedKernels
sudo cp -a immutablekernel prelinkedkernel 
echo "Done"
echo "\nAfter reboot your BigSur should use the BootKernelExtensions.kc"
elif [ -e /System/Volumes/Preboot/*/boot/System/Library/KernelCollections/ ]
then
cd /System/Volumes/Preboot/*/boot/System/Library/KernelCollections/
cd .. ; cd .. ; cd .. ; cd ..
cd System/Library/CoreServices/
sudo mv PlatformSupport.plist PlatformSupport.plist2
sudo rm com.apple.Boot.plist com.apple.Boot.plist2
cd ..
cd PrelinkedKernels
sudo cp -a immutablekernel prelinkedkernel
echo "Done"
echo "\nAfter reboot your BigSur should use the BootKernelExtensions.kc"
else
echo "\nWarning: you have multiple separate APFS containers to find your correct BigSur APFS Preboot type:\n\ndiskutil unmount Preboot\ndiskutil list | grep Preboot\n(select the largest MB Preboot and mount)\ndiskutil mount diskXsY\n\n"
fi

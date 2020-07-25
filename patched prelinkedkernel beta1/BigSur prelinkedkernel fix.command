#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\e[96m;%s\a' "$color"

printf "$'\e[40m'BigSur beta 1 prelinkedkernel fix by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the BigSur beta 1 prelinkedkernel fix"
echo "\nBigSur prelinkedkernel fix can't be executed as standard user if you want to suspend the script just press CTRL+Z"
echo "\nto apply this fix your current account password is required\notherwise the script can't process\n"
echo "\nSetting nvram parameter to enforce compatibility check"
sudo nvram boot-args="-no_compat_check"
echo "Done"
echo "\nDetecting and adjusting BigSur APFS Preboot"
curl https://github.com/jacklukem/BigSurfixes/raw/master/prelinkedkernel%20fix/com.apple.Boot.plist --progress-bar -L -o /private/tmp/com.apple.Boot.plist
diskutil mount Preboot
cd /Volumes/Preboot/*/boot/System/Library/KernelCollections/
cd .. ; cd .. ; cd .. ; cd ..
cd System/Library/CoreServices/
sudo mv PlatformSupport.plist PlatformSupport.plist2
sudo cp -a /private/tmp/com.apple.Boot.plist .
echo "Done"
echo "\nAfter reboot your BigSur should use the prelinkedkernel instead of BootKernelExtensions.kc\n"







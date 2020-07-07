#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\e[96m;%s\a' "$color"

printf "$'\e[40m'BigSur beta 1 patched BootKernelExtensions by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the BigSur beta 1 patched BootKernelExtensions Sound Wifi AirDrop fix\nthis version applies also a patched BootKernelExtensions for beta1 to include sound, wifi and AirDrop"
echo "\nBigSur BootKernelExtensions fix can't be executed as standard user if you want to suspend the script just press CTRL+Z"
echo "\nto apply this fix your current account password is required\notherwise the script can't process\n"
echo "\nSetting nvram parameter to enforce compatibility check"
sudo nvram boot-args="-no_compat_check"
echo "Done"
echo "\nDetecting and adjusting BigSur APFS Preboot"
diskutil mount Preboot
if [ -e /Volumes/Preboot/*/boot/System/Library/KernelCollections/ ]
then
curl https://github.com/jacklukem/BigSurfixes/raw/master/BootKernelExtensions%20fix/com.apple.Boot.plist --progress-bar -L -o /private/tmp/com.apple.Boot.plist
curl https://github.com/jacklukem/BigSurfixes/blob/master/patched%20prelinkedkernel%20beta1/prelinkedkernel%20sound%20wifi%20airdrop%20beta1/BootKernelExtensions.kc.zip?raw=true --progress-bar -L -o /private/tmp/BootKernelExtensions.zip
cd /Volumes/Preboot/*/boot/System/Library/KernelCollections/
sudo unzip /private/tmp/BootKernelExtensions.zip -d .
cd .. ; cd .. ; cd .. ; cd ..
cd System/Library/CoreServices/
sudo mv PlatformSupport.plist PlatformSupport.plist2
sudo cp -a /private/tmp/com.apple.Boot.plist .
echo "Done"
echo "\nAfter reboot your BigSur should use the prelinkedkernel instead of BootKernelExtensions.kc\n and AirDrop channel should work\n"
elif [ -e /System/Volumes/Preboot/*/boot/System/Library/KernelCollections/ ]
then
curl https://github.com/jacklukem/BigSurfixes/raw/master/BootKernelExtensions%20fix/com.apple.Boot.plist --progress-bar -L -o /private/tmp/com.apple.Boot.plist
curl https://github.com/jacklukem/BigSurfixes/blob/master/patched%20prelinkedkernel%20beta1/prelinkedkernel%20sound%20wifi%20airdrop%20beta1/BootKernelExtensions.kc.zip?raw=true --progress-bar -L -o /private/tmp/BootKernelExtensions.zip
cd /System/Volumes/Preboot/*/boot/System/Library/KernelCollections/
sudo unzip /private/tmp/BootKernelExtensions.zip -d .
cd .. ; cd .. ; cd .. ; cd ..
cd System/Library/CoreServices/
sudo mv PlatformSupport.plist PlatformSupport.plist2
sudo cp -a /private/tmp/com.apple.Boot.plist .
echo "Done"
echo "\nAfter reboot your BigSur should use the patched BootKernelExtensions.kc\n and AirDrop channel should work\n"
else
echo "\nWarning: you have multiple separate APFS containers to find your correct BigSur APFS Preboot type:\n\ndiskutil unmount Preboot\ndiskutil list | grep Preboot\n(select the largest MB Preboot and mount)\ndiskutil mount diskXsY\n\n"
fi

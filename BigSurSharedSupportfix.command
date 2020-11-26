#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\e[96m;%s\a' "$color"

printf "$'\e[40m'BigSur beta SharedSupport.dmg fix by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the BigSur Beta SharedSupport.dmg fix, this version works also with non-APFS legacy usb"
echo "\nBigSur beta SharedSupport.dmg fix can't be executed as standard user if you want to suspend the script just press CTRL+Z"
echo "\nto apply this fix your current account password is required\notherwise the script can't process\n"
echo "\nSetting nvram parameter to enforce compatibility check"
sudo nvram boot-args="-no_compat_check"
echo "Done"
echo "\nDetecting BigSur InstallAssistant app"
SharedSupport="$(ls /Applications/*.app/Contents/SharedSupport/SharedSupport.dmg)";
if [ -e /Volumes/BigSurBaseSystemfix/BaseSystem/BaseSystem.dmg ] && [ -e "$SharedSupport" ] ;
then
echo "\nBigSur Installer app found, now copying the updated SharedSupport.dmg to the target BigSurBaseSystemfix, this might take up to 15 minutes\n"
sudo cp /Applications/*.app/Contents/SharedSupport/SharedSupport.dmg /Volumes/BigSurBaseSystemfix/*.app/Contents/SharedSupport/
echo "\nDone\n"
echo "\nAfter reboot your BigSur stage2 macOS Installer should use an updated SharedSupport.dmg with BootKernelExtensions.kc as prelinkedkernel\n"
else
echo "\nWarning: You don't have any BigSur Installer app or InstallAssistant on Applications folder or any plugged USB BigSurBaseSystemfix\n"
fi
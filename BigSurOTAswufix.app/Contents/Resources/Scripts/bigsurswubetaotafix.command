#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke

printf '\e[96m;%s\a' "$color"
printf "$'\e[40m'OTA Software update beta fix by jackluke"
clear && printf '\e[3J'
echo "\n\nWelcome to the BigSur OTA Software update beta fix"
echo "\nUse keyboard arrows or mouse and trackpad scrolling to read this report"
echo "\nCopying the SoftwareUpdate VirtualMachineFaker dynamic library"
echo "\nDone"
sudo mount -uw /
sudo cp -a ~/*/BigSurOTAswufix.app/Contents/Resources/Scripts/SUVMMFaker.dylib ~/
sudo chown root:wheel ~/SUVMMFaker.dylib
launchctl setenv DYLD_INSERT_LIBRARIES ~/SUVMMFaker.dylib
echo "\nSwitching to Catalina Beta Update channel"
sudo /System/Library/PrivateFrameworks/Seeding.framework/Resources/seedutil enroll DeveloperSeed
sleep 2
echo "\nRelaunching softwareupdate service catalog"
sudo launchctl unload /System/Library/LaunchDaemons/com.apple.softwareupdated.plist
sleep 3
sudo launchctl load /System/Library/LaunchDaemons/com.apple.softwareupdated.plist
sleep 1
echo "\nDone"
echo "\nRefreshing available BigSur OTA Beta updates"
echo "sudo softwareupdate --list (GUI mode)"
open /System/Library/PreferencePanes/SoftwareUpdate.prefPane
echo "\nDone"
echo "\nIn few seconds redirecting to the BigSur Software Update panel"
echo "\nPlease wait in the Software Update prefpane at least one minutes and Beta updates will automatically show up"
echo "\nWhen ready select a BigSur OTA Beta update, start to download it and after 3% of downloading then apply the OTA fix"
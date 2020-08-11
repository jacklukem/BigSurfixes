#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke

printf '\e[96m;%s\a' "$color"
printf "$'\e[40m'OTA Software update beta fix by jackluke"
clear && printf '\e[3J'
echo "\n\nWelcome to the BigSur OTA Software update beta fix"
echo "\nUse keyboard arrows or mouse and trackpad scrolling to read this report"
echo "\nDetecting your OTA dist file"
if [ -e /Library/Updates/*-*/*-*.dist ]
then
echo "\nYour OTA dist file is correctly detected"
echo "\nSetting nvram parameter to enforce any AMFI compatibility check"
sudo nvram boot-args="-no_compat_check amfi_get_out_of_my_way=1"
sudo defaults write /Library/Preferences/com.apple.security.libraryvalidation.plist DisableLibraryValidation -bool true
echo "\nChecking library validation"
sudo defaults read /Library/Preferences/com.apple.security.libraryvalidation.plist
echo "\nAny AMFI disable library validation method is applied to BigSur"
echo "\nDetecting machine board id"
Macmid="$(sysctl -n hw.model)";
echo "\nYour machine model is ${Macmid}"
Macmidswap='s/\'${Macmid}'/MacExample7,0/';
Boardid="$(ioreg -l | grep "board-id" | awk -F\" '{print $4}')";
echo "\nYour machine board number is ${Boardid}\n"
OTAdist="$(ls -l /Library/Updates/*-*/*-*.dist)";
cd /Library/Updates/*-*/
echo "\nPatching the OTA dist file\n${OTAdist}"
sudo sed -i -e "s/'Mac-9AE82516C7C6B903',/'Mac-F2268DC8', 'Mac-50619A408DB004DA', 'Mac-F42D86A9', 'Mac-742912EFDBEE19B3', 'Mac-942B59F58194171B', 'Mac-35C1E88140C3E6CF', 'Mac-77EB7D7DAF985301', 'Mac-F22C89C8', 'Mac-35C5E08120C7EEAF', 'Mac-F222BEC8', 'Mac-F60DEB81FF30ACF6', 'Mac-7BA5B2794B2CDB12', 'Mac-27ADBB7B4CEE8E61', 'Mac-F42D89C8', 'Mac-F2268AC8', 'Mac-F42C89C8', 'Mac-F2238AC8', 'Mac-F2218FA9', 'Mac-F2268EC8', 'Mac-7DF21CB3ED6977E5', 'Mac-F2268CC8', 'Mac-C3EC7CD22292981F', 'Mac-06F11F11946D27C5', 'Mac-F22C8AC8', 'Mac-F226BEC8', 'Mac-F305150B0C7DEEEF', 'Mac-4B7AC7E43945597E', 'Mac-189A3D4F975D5FFC', 'Mac-FA842E06C61E91C5', 'Mac-06F11FD93F0323C5', 'Mac-9AE82516C7C6B903', 'Mac-81E3E92DD6088272', 'Mac-F2208EC8', 'Mac-F22788AA', 'Mac-F2218FC8', 'Mac-65CE76090165799A', 'Mac-B809C3757DA9BB8D', 'Mac-F22587C8', 'Mac-DB15BD556843C820', 'Mac-F42D88C8', 'Mac-F42D86C8', 'Mac-F2218EA9', 'Mac-F2268DAE', 'Mac-2BD1B31983FE1663', 'Mac-94245A3940C91C80', 'Mac-942B5BF58194151B', 'Mac-42FD25EABCABB274', 'Mac-AFD8A9D944EA4843', 'Mac-7DF2A3B5E5D671ED', 'Mac-2E6FAB96566FE58C', 'Mac-BE0E8AC46FE800CC', 'Mac-F223BEC8', 'Mac-66F35F19FE2A0D05', 'Mac-8ED6AF5B48C039E1', 'Mac-FC02E91DDD3FA6A4', 'Mac-3CBD00234E554E41', 'Mac-F22586C8', 'Mac-942C5DF58193131B', 'Mac-9F18E312C5C2BF0B', 'Mac-F65AE981FFA204ED', 'Mac-942452F5819B1C1B', 'Mac-94245B3640C91C81', 'Mac-4BC72D62AD45599E', 'Mac-F2218EC8', 'Mac-F42386C8', 'Mac-031B6874CF7F642A', 'Mac-942459F5819B171B', 'Mac-00BE6ED71E35EB86', 'Mac-937CB26E2E02BB01', 'Mac-F42388C8', 'Mac-F227BEC8', 'Mac-F22587A1', 'Mac-F4238BC8', 'Mac-F221BEC8', 'Mac-C08A6BB70A942AC2', 'Mac-6F01561E16C75D06', 'Mac-F4238CC8', 'Mac-F42C86C8', 'Mac-F2238BAE', 'Mac-F22C86C8', 'Mac-031AEE4D24BFF0B1', 'Mac-F42D89A9', 'Mac-F22589C8', 'Mac-F221DCC8', 'Mac-FFE5EF870D7BA81A', 'Mac-A369DDC4E67F1C45', 'Mac-F42C88C8', 'Mac-E43C1C25D4880AD6',/g" /Library/Updates/*-*/*-*.dist
echo "\nDone"
echo "\nLet the OTA update to complete through its automatic phases, after apply the known BigSur post install patches\n"
else
echo "\nWARNING: You need to run first the Sotware Update fix to allow Beta Updates\nif you already done it, then the BigSur OTA dist is not yet ready or downloaded\n\nCheck again your Software Update panel if a new update is available and start to Download the OTA update clicking the Update Now button, then download at least 1% and after a minute retry the OTA fix button\n"
fi
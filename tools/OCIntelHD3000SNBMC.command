#!/bin/sh
#
#  simple bash script by jackluke  

echo "Welcome to the IntelHD3000 Sandy Bridge framebuffer board id fix for Mojave and Catalina when using an OpenCore spoofing"
SIPcheck()
{
    echo "Checking System Integrity Protection"
    if [[ $(csrutil status | grep status) == *disabled* || $(csrutil status | grep status) == *unknown* ]]; then
        echo "System Integrity Protection is correctly disabled"
    else
        echo "System Integrity Protection is not disabled"
        echo "Use csrutil disable before using this tool"
        exit
    fi
}
SIPcheck
sudo mount -uw / ; killall Finder
SNBthis="$(ioreg -l | grep "board-id" | awk -F\" '{print $4}')";
SNBswap='s/\Mac-94245B3640C91C81/\'${SNBthis}'/';
sudo -E perl -pi -e ${SNBswap} /System/Library/Extensions/AppleIntelSNBGraphicsFB.kext/Contents/MacOS/AppleIntelSNBGraphicsFB
echo "Rebuilding kextcache can takes up to 5 minutes..."
sudo kextcache -system-prelinked-kernel -all-loaded
sudo kextcache -system-caches
echo "IntelHD3000 Sandy Bridge framebuffer patched with spoofed board id, restart to check changes"
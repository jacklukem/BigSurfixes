# BigSurfixes
Big Sur fixes for unsupported Mac

to support Big Sur booting on non-APFS mac or APFS firmware mac

BigSur added the BootKernelExtensions.kc as the new kernelcache with new command kmutil

but kextcache command and prelinkedkernel are still working:

https://forums.macrumors.com/threads/macos-11-big-sur-on-unsupported-macs-thread.2242172/post-28610988

Here are the most updated Big Sur fixes:

I made also a customized USBopencore setup to boot BigSur from any Penryn Core2Duo non-APFS or APFS mac:
https://github.com/jacklukem/USBOpenCoreAPFSloader/releases/tag/3.1

From Big Sur beta 3 the prelinkedkernel for some machines changed for Ivy Bridge use this:
https://github.com/jacklukem/BigSurfixes/blob/master/BigSur%20IvyBridge%20beta3%20prelinkedkernel%20fix.command.zip?raw=true

any non-APFS Mac or legacy USB mac to fix telemetry, ethernet and Wifi:
https://github.com/jacklukem/BigSurfixes/blob/master/prelinkedkernel%20fix4%20beta1.command

to remove any prelinkedkernel fix and use the stock BigSur ones use this:
https://github.com/jacklukem/BigSurfixes/blob/master/BigSur%20generic%20BKE.command.zip?raw=true

From BigSur Beta 2 non-Metal GPU require a reduced transparency to boot correctly:
https://forums.macrumors.com/threads/macos-11-big-sur-on-unsupported-macs-thread.2242172/post-28652497

To try fix "sudo mount -uw /" disabling sealed volume and snapshot booting on BigSur check here:
https://forums.macrumors.com/threads/macos-11-big-sur-on-unsupported-macs-thread.2242172/post-28701959


The following guide is for manual patching, to apply the prelinkedkernel fix after BigSur Install:

diskutil apfs list

diskutil list | grep Preboot

(if have multiple separated APFS containers, just mount the largest MB Preboot Volume)

diskutil mount Preboot

Locate your BigSur Data Volume UUID

replace the "prelinkedkernel fix" file in this path:

/Volumes/Preboot/UUID-BigSur/System/Library/CoreServices/

replace it also here: /Volumes/Preboot/UUID-BigSur/Library/Preferences/SystemConfiguration/

replace the "patched prelinkedkernel beta1" ("patched prelinkedkernel" folder will contain newer beta fixes) or "legacy usb prelinkedkernel beta1" (this one should work on any non-APFS Mac enabling also Wifi for AirPortBrcm4331 cards) in this path:

/Volumes/Preboot/UUID-BigSur/System/Library/PrelinkedKernels/

For the "installer fix" make a BigSur USB Installer with createinstallmedia:

sudo /Applications/Install\ macOS\ Beta.app/Contents/Resources/createinstallmedia --volume /Volumes/BigSurInstaller/

and replace the "installer fix" file in this path:

/Volumes/USBInstallerBigSur/Library/Preferences/SystemConfiguration/

I also included some "legacyusb fix for installer"

for rebuild BigSur kernelcache from single user mode copy both the .sh files on your root / BigSur disk and home folder that is the / BigSur Label - Data / Users / yourusername /

then from single user mode type : chmod 755 kcsingleuser.sh ; ./kcsingleuser.sh

(credit to ASentientBot for Hax.dylib fix for "Install macOS Beta.app" and "apfs_boot_util" to mount the BigSur Data Volume from single user mode, after using "apfs_boot_util" from single user mode apart the Data Volume also the Preboot Volume is available in this path /System/Volumes/)

Note: if you use my "prelinkedkernel fix command" directly from BigSur the Preboot Volume mount point is this:

/System/Volumes/Preboot/

(can notice this directly from BigSur with "ls /System/Volumes/" )

So I uploaded those modified scripts to run also directly from BigSur normal booting.

BigSur introduced also a new SIP for sealing the System Volume, to disable from any APFS firmware Mac simply boot the USB BigSur Installer (or BigSur Recovery), open terminal and type: "csrutil authenticated-root disable"

While instead to disable "csrutil authenticated-root" from a non-APFS or legacy USB mac, copy the "csrutil2" (or use the zip file) binary file to any USB MacOS Installer (minimum El Capitan when apple introduced SIP but should use an USB Catalina Installer because it has more recent SDK) in its root folder / , then boot from the macOS USB Installer, open a recovery terminal and type:

cd / ; mount -uw / ; chmod 755 csrutil2

./csrutil2 authenticated-root disable

Otherwise if you use a Catalina Recovery, copy the file on an external USB drive, then from Catalina recovery terminal:

cd /Volumes/ ; ls

cd YourUSBLabel

mount -uw /

chmod 755 csrutil2

./csrutil2 authenticated-root disable

(Note: for any raw file downloaded to use them just remove the .dms extension that is set from github)

My prelinkedkernel fixes still work on Big Sur beta 2 for targeting group of machines use these:

any Ivy Bridge Mac to fix Wifi and AirDrop:
https://github.com/jacklukem/BigSurfixes/blob/master/bigsur%20fixes%20command/BigSur%20IvyBridge%20prelinkedkernel%20Sound%20AirDrop%20fix%20beta1.command.zip

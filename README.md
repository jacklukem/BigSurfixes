# BigSurfixes
Big Sur fixes for unsupported Mac

to support Big Sur booting on non-APFS mac or APFS firmware mac

BigSur added the BootKernelExtensions.kc as the new kernelcache with new command kmutil

but kextcache command and prelinkedkernel are still working:

https://forums.macrumors.com/threads/macos-11-big-sur-on-unsupported-macs-thread.2242172/post-28610988

to apply the prelinkedkernel fix after BigSur Install:

diskutil apfs list

diskutil list | grep Preboot

(if have multiple separated APFS containers, just mount the largest MB Preboot Volume)

diskutil mount Preboot

Locate your BigSur Data Volume UUID

replace the "prelinkedkernel fix" file in this path:

/Volumes/Preboot/UUID-BigSur/System/Library/CoreServices/

replace it also here: /Volumes/Preboot/UUID-BigSur/Library/Preferences/SystemConfiguration/

replace the "patched prelinkedkernel beta1" or "legacy usb prelinkedkernel beta1" (this one should work on any non-APFS Mac enabling also Wifi for AirPortBrcm4331 cards) in this path:

/Volumes/Preboot/UUID-BigSur/System/Library/PrelinkedKernels/

For the "installer fix" make a BigSur USB Installer with createinstallmedia:

sudo /Applications/Install\ macOS\ Beta.app/Contents/Resources/createinstallmedia --volume /Volumes/BigSurInstaller/

and replace the "installer fix" file in this path:

/Volumes/USBInstallerBigSur/Library/Preferences/SystemConfiguration/

I also included some "legacyusb fix for installer"

for rebuild BigSur kernelcache from single user mode copy both the .sh files on your root / BigSur disk and home folder that is the / BigSur Label - Data / Users / yourusername /

then from single user mode type : chmod 755 kcsingleuser.sh ; ./kcsingleuser.sh

(credit to ASentientBot for "apfs_boot_util" to mount the BigSur Data Volume from single user mode, after using "apfs_boot_util" from single user mode apart the Data Volume also the Preboot Volume is available in this path /System/Volumes/)

Note: if you use my "prelinkedkernel fix command" directly from BigSur the Preboot Volume mount point is this:

/System/Volumes/Preboot/

(can notice this directly from BigSur with "ls /System/Volumes/" )

So I uploaded those modified scripts to run also directly from BigSur normal booting.

BigSur introduced also a new SIP for sealing the System Volume, to disable from any APFS firmware Mac simply boot the USB BigSur Installer (or BigSur Recovery), open terminal and type: "csrutil authenticated-root disable"

While instead to disable "csrutil authenticated-root" from a non-APFS or legacy USB mac, copy the "csrutil2" binary file to any USB MacOS Installer (minimum El Capitan when apple introduced SIP but should use an USB Catalina Installer because it has more recent SDK) in its root folder / , then boot from the macOS USB Installer, open a recovery terminal and type:

cd / ; chmod 755 csrutil2

./csrutil2 authenticated-root disable

Otherwise if you use a Catalina Recovery, copy the file on an external USB drive, then from Catalina recovery terminal:

cd /Volumes/ ; ls

cd YourUSBLabel

chmod 755 csrutil2

./csrutil2 authenticated-root disable

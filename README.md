# BigSurfixes

## `BigSur Installer BaseSystem fix` updated for 11.0.1 release candidate for non-APFS or legacy USB Penryn Core2Duo and Arrandale (also for other Intel Architectures) this new version contains many useful patching apps: https://github.com/jacklukem/BigSurfixes/releases/ 
  
Quick guide:
https://github.com/jacklukem/BigSurfixes/blob/master/BigSurBaseSystemfix.pdf

![alt text](https://github.com/jacklukem/BigSurfixes/blob/master/BigSurFixes%20table.png)

<a href="https://forums.macrumors.com/threads/macos-11-big-sur-on-unsupported-macs-thread.2242172/post-29170178">
  
![alt text](https://github.com/jacklukem/BigSurfixes/blob/master/installer%20fix/BaseSystem%20fix%20icon.jpeg?raw=true)

![alt text](https://github.com/jacklukem/BigSurfixes/blob/master/installer%20fix/BaseSystem%20fix%20updated.jpeg?raw=true)

click here for more detail</a>

<details>
<summary>
<i>These previous fixes are now merged with BigSur Installer BaseSystem legacy USB fix </i>
</summary>
  

## *Making a patched BigSur Installer through BaseSystem legacy USB fix updated for beta 9 and beta 10 mainly for non-APFS or legacy USB Penryn Core2Duo through a stock createinstallmedia or opencore*
https://forums.macrumors.com/threads/macos-11-big-sur-on-unsupported-macs-thread.2242172/post-28973673

The stage2 installer will continue when target is an internal SATA disk, but on non-APFS or legacy USB when targeting an external USB this should be applied from Mojave or Catalina: https://github.com/jacklukem/BigSurfixes/raw/master/BigSur%20BaseSystem%20stage2%20installer%20fix.zip

To fix USBopencore "exiting efiboot", boot from BigSurInstaller (BaseSystem fix) or from Recovery with CMD+S then try this:
https://forums.macrumors.com/threads/macos-11-big-sur-on-unsupported-macs-thread.2242172/post-28948321

you could skip stage3 installer (that is seal and system snapshot) but for non-APFS or legacy USB you need this to boot with CMD+S and exit:
https://github.com/jacklukem/BigSurfixes/blob/master/penryn%20c2d%20bigsur%20beta6/BKE%20kc%20b9%20patched.zip

After USBopencore kext patching to boot without opencore and assign BigSur labels use this method:
https://forums.macrumors.com/threads/macos-11-big-sur-on-unsupported-macs-thread.2242172/post-28957937

to download a BigSur full installer from Mojave or Catalina try this:
https://forums.macrumors.com/threads/macos-11-big-sur-on-unsupported-macs-thread.2242172/post-28740283
or this: https://apps.apple.com/app/macos-11-0-beta/id1497794093?mt=12

tips to make a patched BigSur Utitilies menu:
https://forums.macrumors.com/threads/macos-11-big-sur-on-unsupported-macs-thread.2242172/post-28987885

## *Big Sur fixes for unsupported Mac*

to support Big Sur booting on non-APFS mac or APFS firmware mac

BigSur added the `BootKernelExtensions.kc` as the new kernelcache with new command `kmutil`

but `kextcache` command and `prelinkedkernel` are still working:

https://forums.macrumors.com/threads/macos-11-big-sur-on-unsupported-macs-thread.2242172/post-28610988

## *Currently these fixes still work for Big Sur beta 4 Build `20A5343i`*
also works for public beta 1 Build `20A5343j`: http://swcdn.apple.com/content/downloads/29/11/001-35028-A_7VBLVEPJM9/fmewkm9mb99ja9cbqfp4scme3bzlaurv8v/InstallAssistant.pkg

(apple removed previous beta full installers but you can find them on internet with keyword DMG)

check here for versions info: https://en.wikipedia.org/wiki/MacOS_Big_Sur#Release_history

## *prelinkedkernel fixes don't work from beta 6 Build `20A5364e` (BaseSystem legacy usb fix still works on beta 10)*
you should use from this version my USBOpencore setup in repository and BootKernelExtensions.kc

## *There was an issue from beta 7, but from beta 9 Build `20A5384c` Penryn Core2Duo can boot BigSur kernel*
I uploaded some patched BKE to allow boot with CMD+S that should be copied on: /Volumes/Preboot/UUIDBigSur/boot/System/Library/KernelCollections/
https://github.com/jacklukem/BigSurfixes/tree/master/penryn%20c2d%20bigsur%20beta6

Here are the most updated Big Sur fixes (for BigSur beta 3 that works also for beta 4 Build 20A5343i):

- I made also a customized USBopencore setup to boot BigSur from any Penryn Core2Duo non-APFS or APFS mac (also Sandy Bridge and Ivy Bridge):
https://github.com/jacklukem/USBOpenCoreAPFSloader/releases/tag/3.1
https://github.com/jacklukem/USBOpenCoreAPFSloader/releases/tag/4.0

- `BaseSystem legacy usb fix` to make an USB BigSur Installer for non-APFS or legacy USB Mac that still works for beta 6 Build `20A5364e` (added also an ASentientBot Hax3 to fix domain error and an Icon for apple startup manager): https://forums.macrumors.com/threads/macos-11-big-sur-on-unsupported-macs-thread.2242172/post-28737950
(previous version: https://forums.macrumors.com/threads/macos-11-big-sur-on-unsupported-macs-thread.2242172/post-28726070)

- From Big Sur beta 3 the prelinkedkernel for any Ivy Bridge Mac to fix Wifi, AirDrop and dual GPUs IntelHD4000 and Nvidia Kepler :
https://github.com/jacklukem/BigSurfixes/blob/master/BigSur%20IvyBridge%20beta3%20prelinkedkernel%20fix.command.zip?raw=true

- From Big Sur beta 3 any Penryn Core2Duo non-APFS Mac or legacy USB mac to fix telemetry, ethernet and Wifi:
https://github.com/jacklukem/BigSurfixes/blob/master/BigSur%20Penryn%20beta3%20prelinkedkernel%20fix.command.zip?raw=true

- New experimental prelinkedkernel fix for Big Sur beta 3 to include Nvidia GeForce Tesla framebuffer (credit to ASentientBot for Nvidia fixes)
on any Penryn Core2Duo non-APFS Mac or legacy USB mac (also fix telemetry, ethernet and Wifi):
https://github.com/jacklukem/BigSurfixes/blob/master/BigSur%20beta3%20Nvidia%20Tesla%20fix.command.zip?raw=true

- To fix "sudo mount -uw /" disabling sealed volume and snapshot booting on BigSur check here:
https://forums.macrumors.com/threads/macos-11-big-sur-on-unsupported-macs-thread.2242172/post-28701959

- To fix Night Shift on BigSur for unsupported mac:
https://forums.macrumors.com/threads/macos-11-big-sur-on-unsupported-macs-thread.2242172/post-28716098

- to remove any prelinkedkernel fix and use the stock BigSur ones use this:
https://github.com/jacklukem/BigSurfixes/blob/master/BigSur%20generic%20BKE.command.zip?raw=true

- From BigSur Beta 2 non-Metal GPU required a preset reduced transparency to boot correctly:
https://forums.macrumors.com/threads/macos-11-big-sur-on-unsupported-macs-thread.2242172/post-28652497

- For USB Big Sur Installer to try skip system sealing and snapshot booting check here:
https://forums.macrumors.com/threads/macos-11-big-sur-on-unsupported-macs-thread.2242172/post-28707887
https://forums.macrumors.com/threads/macos-11-big-sur-on-unsupported-macs-thread.2242172/post-28712634




*The following guide is for manual patching, to apply the prelinkedkernel fix after BigSur Install:*

> diskutil apfs list

> diskutil list | grep Preboot

(if have multiple separated APFS containers, just mount the largest MB Preboot Volume)

> diskutil mount Preboot

> diskutil info / | grep UUID

Locate your BigSur Data Volume UUID

replace the `"prelinkedkernel fix"` file in this path:

`/Volumes/Preboot/UUID-BigSur/System/Library/CoreServices/`

replace it also here: `/Volumes/Preboot/UUID-BigSur/Library/Preferences/SystemConfiguration/`

replace the `"patched prelinkedkernel"` (contains newer beta fixes also for any non-APFS Mac enabling Wifi for AirPortBrcm4331 cards) in this path:

`/Volumes/Preboot/UUID-BigSur/System/Library/PrelinkedKernels/`

For the `"installer fix"` make a BigSur USB Installer with `createinstallmedia`:

> sudo /Applications/Install\ macOS\ Big\ Sur\ Beta.app/Contents/Resources/createinstallmedia --volume /Volumes/BigSurInstaller/

and replace the `"installer fix"` file in this path:

`/Volumes/USBInstallerBigSur/Library/Preferences/SystemConfiguration/`

I also included some `"legacyusb fix for installer"`

for rebuild BigSur kernelcache from single user mode copy both the .sh files on your root / BigSur disk and home folder that is the / BigSur Label - Data / Users / yourusername /

then from single user mode type : `chmod 755 kcsingleuser.sh ; ./kcsingleuser.sh`

(credit to ASentientBot for `Hax.dylib` fix for "Install macOS Beta.app" and "apfs_boot_util" to mount the BigSur Data Volume from single user mode, after using `"apfs_boot_util"` from single user mode apart the Data Volume also the Preboot Volume is available in this path `/System/Volumes/`)

Note: if you use my `"prelinkedkernel fix command"` directly from BigSur the Preboot Volume mount point is this:

`/System/Volumes/Preboot/`

(can notice this directly from BigSur with `"ls /System/Volumes/"` )

So I uploaded those modified scripts to run also directly from BigSur normal booting.

BigSur introduced also a new SIP for sealing the System Volume, to disable from any APFS firmware Mac simply boot the USB BigSur Installer (or BigSur Recovery), open terminal and type: `"csrutil authenticated-root disable"`

While instead to disable "csrutil authenticated-root" from a non-APFS or legacy USB mac, copy the "csrutil2" (or use the zip file) binary file to any USB MacOS Installer (minimum El Capitan when apple introduced SIP but should use an USB Catalina Installer because it has more recent SDK) in its root folder / , then boot from the macOS USB Installer, open a recovery terminal and type:

> cd / ; mount -uw / ; chmod 755 csrutil2

> ./csrutil2 authenticated-root disable

Otherwise if you use a Catalina Recovery, copy the file on an external USB drive, then from Catalina recovery terminal:

> cd /Volumes/ ; ls

> cd YourUSBLabel

> mount -uw /

> chmod 755 csrutil2

> ./csrutil2 authenticated-root disable

(Note: for any raw file downloaded to use them just remove the .dms extension that is set from github)


</details>

additional tips if you can't boot the BaseSystem fix: https://forums.macrumors.com/threads/macos-11-big-sur-on-unsupported-macs-thread.2242172/post-29214703

Currently for non-APFS firmware Mac with legacy USB host external target while stage2 installer has been fixed, there is still an issue with stage3 installer, this occurs with a clean BigSur installation, here are some explaination to workaround this issue :

- for a clean install on external legacy USB target, try to erase the disk as HFS+ (then the stage2 installer should auto convert to APFS)
- to use stage2 and stage3 installer without fixes (or simply through OpenCore) on those non-APFS Mac you should install BigSur on internal SATA disk, then through CCC or BigSur DiskUtility you can clone the installed BigSur to external USB and it will work after (applied the "BigSurFixes legacy USB patches")
- you could even install BigSur on internal SATA disk, then unplug and plug it externally through USB and it will work
- The stage3 installer on external USB target is skippable or fixable when updating a previous already installed Catalina or BigSur, because it requires an already done apple setup (to fix the apfs firmlinks issues)

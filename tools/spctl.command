#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\033[1;38;5;219m' "$color"

printf "\e[40m'Kernel Extensions Loading Menu beta by jacklukem"

echo "\n\n Welcome to Kernel Extensions Loading Menu\n\n\nthis feature should allow to install and load third party kext on Big Sur\n\n\n"
PS3="
Please enter your choice: "
options=("Add a custom id for kext consent" "Show third party ids" "Enable kext consent for virtualization" "List kext consent ids" "Disable spctl kext consent" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Add a custom id for kext consent")
            printf '\033[1;38;5;75m'
            echo "\nAdding a custom id for kext consent example for Nvidia 6KR3T733EC\n"
            read -p "Type the team identifier -> " TeamID
	    /usr/sbin/spctl kext-consent add $TeamID
            /usr/sbin/spctl kext-consent list
	    echo "\nDone\n\npress enter to show menu\ntype 6 to exit"
            ;;
        "Show third party ids")
            printf '\033[1;38;5;158m'
            echo "\nMicrosoft - UBF8T346G9 ; Dropbox - G7HH3F8CAK ; Cisco - DE8Y96K9QP ; Broadcom - Y2CCP3S9W7 ; HP - 6HB5Y2QTA3 ; Google - EQHXZ8M8AV ; AdobeFlash - EHWBRW848H ; Intel - Z3L495V9L4 ; BlueStacks - QX5T8D6EDU ; Kaspersky - 2Y8XE5CQ94 ; Symantec - 9PTGMPNXZ2 ; Bitdefender - GUNFMW623Y ; Trendmicro - E8P47U2H32 ; Eset - P8DQRXPVLP ; Sophos - 2H5GFH3774 ; Avast - 6H4HRTU5E3 ; Fortinet - AH4XFXJ7DK ; Crowdstrike - X9E956P446 ; Paloaltonetworks - PXPZ95SK77 ; Nvidia - 6KR3T733EC ; "
	    echo "\nDone\n\npress enter to show menu\ntype 6 to exit"
            ;;
        "Enable kext consent for virtualization")
            printf '\033[1;38;5;154m'
            echo "\nEnabling kext for install VirtualBox, Vmware and Parallels"
	    /usr/sbin/spctl kext-consent add VB5E2TV963
            /usr/sbin/spctl kext-consent add EG7KH642X6
            /usr/sbin/spctl kext-consent add 4C6364ACXT
            /usr/sbin/spctl kext-consent add 6KR3T733EC
	    echo "\nDone\n\npress enter to show menu\ntype 6 to exit"
            ;;
        "List kext consent ids")
            printf '\033[1;38;5;159m'
            echo "\nListing ids for kext consent"
            /usr/sbin/spctl kext-consent list
	    echo "\nDone\n\npress enter to show menu\ntype 6 to exit"
            ;;
        "Disable spctl kext consent")
	    echo "\nThis should allow any third party kext"
            /usr/sbin/spctl kext-consent disable
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY \n\npress enter to show menu\ntype 6 to exit";;
    esac
done
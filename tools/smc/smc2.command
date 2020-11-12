#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\033[1;38;5;219m' "$color"

printf "\e[40m'smcFanControl Menu beta by jacklukem"

printf "\n\n Welcome to the smcFanControl Ivy Bridge Menu\n\n\n"
PS3="
Please enter your choice: "
options=("Detect current CPU Cores average temp" "Maximise Fans RPM speed for CPU cooling" "Set Fans RPM speed to automatic default" "Set Fans RPM quieter and balanced for CPU cooling" "Return")
select opt in "${options[@]}"
do
    case $opt in
        "Detect current CPU Cores average temp")
            printf '\033[1;38;5;75m'
            printf "\nDetecting current CPU Cores average temperature\n"
	    CPUaverageT=$(~/*/smc/smc -k TC0E -r|awk '{print $3}')
            echo "\n\nCurrent CPU average temperature is $CPUaverageT °C"
            CPUaverageT=${CPUaverageT%.*}
            CPUdegF=$[ $CPUaverageT * 9 / 5 + 32 ]
            echo "\n\nCurrent CPU average temperature is $CPUaverageT °C (Celsius)\nThis is current value converted in $CPUdegF °F (Fahrenheit)"
	    echo "\n\nDone\n\npress enter to show menu\ntype 5 to exit"
            ;;
        "Maximise Fans RPM speed for CPU cooling")
            printf '\033[1;38;5;159m'
            printf "\nMaximising Fans to 6000 RPM speed to keep CPU cooler\n"
	    ~/*/smc/smc -k "FS! " -w 0003
	    ~/*/smc/smc -k F0Tg -w 5dc0
            ~/*/smc/smc -k F1Tg -w 5dc0
            ~/*/smc/smc -f
	    echo "\nDone\n\npress enter to show menu\ntype 5 to exit"
            ;;
        "Set Fans RPM speed to automatic default")
            printf '\033[1;38;5;154m'
            printf "\nSetting Fans 2000 RPM speed to automatic default\n"
	    ~/*/smc/smc -k "FS! " -w 0000
            ~/*/smc/smc -f
	    echo "\nDone\n\npress enter to show menu\ntype 5 to exit"
            ;;
        "Set Fans RPM quieter and balanced for CPU cooling")
            printf '\033[1;38;5;75m'
            printf "\nSetting Fans to balanced RPM speed for current CPU temp\n"
            CPUTEMP=$(~/*/smc/smc -k TC0E -r|awk '{print $3}')
            CPUTEMP=${CPUTEMP%.*}
            echo "\n\nCurrent CPU average temperature is $CPUTEMP °C"
	    if [ $CPUTEMP -le 60 ]
            then
	    ~/*/smc/smc -k "FS! " -w 0003
	    ~/*/smc/smc -k F0Tg -w 2ee0
            ~/*/smc/smc -k F1Tg -w 2ee0
            elif [ $CPUTEMP -le 65 ]
            then
	    ~/*/smc/smc -k "FS! " -w 0003
	    ~/*/smc/smc -k F0Tg -w 3840
	    ~/*/smc/smc -k F1Tg -w 3840
            elif [ $CPUTEMP -le 70 ]
            then
	    ~/*/smc/smc -k "FS! " -w 0003
	    ~/*/smc/smc -k F0Tg -w 41a0
	    ~/*/smc/smc -k F1Tg -w 41a0
            elif [ $CPUTEMP -le 75 ]
            then
	    ~/*/smc/smc -k "FS! " -w 0003
	    ~/*/smc/smc -k F0Tg -w 4e20
	    ~/*/smc/smc -k F1Tg -w 4e20
            else
	    ~/*/smc/smc -k "FS! " -w 0003
	    ~/*/smc/smc -k F0Tg -w 60e0
	    ~/*/smc/smc -k F1Tg -w 60e0
            fi
            ~/*/smc/smc -f
	    echo "\nDone\n\npress enter to show menu\ntype 5 to exit"
            ;;
        "Quit")
            echo "\n\ntype 5 for previous menu , then type 6 to exit"
            break
            ;;
        *) echo "invalid option $REPLY \n\npress enter to show menu\ntype 5 to exit";;
    esac
done
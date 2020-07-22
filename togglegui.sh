#!/bin/bash
# Menu Script To Turn Linux GUI On Or Off 

#Set Colour Variables
RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

#Check to see if script is running as root, if not exit and print message - "This script must be run as root"
if [[ $EUID -ne 0 ]]; then
    echo -e $RED
   	echo "This script must be run as root" 
    echo -e $NOCOLOR
   	exit 1
fi

# Print description of script.
echo " "
echo " "
echo -e "${GREEN}Selecting GUI on, or GUI off will result in a system reboot.${NOCOLOR} "
echo ""
echo " "
sleep 1


# Start Menu with 3 options. Turn Linux GUI on, Turn Linux GUI off, and Quit script.
options=("GUI On" "GUI Off" "Quit")

select opt in "${options[@]}"
do
    case $opt in
        "GUI On")
            clear
            echo -e "${GREEN}Turning Linux GUI On${NOCOLOR}"
            sleep 1
            systemctl set-default graphical.target
            sleep 1
            echo -e "${GREEN}GUI Enabled${NOCOLOR}"
            sleep 1
            echo -e "${RED}Rebooting System in 5s (CTRL + C to stop reboot).${NOCOLOR}"
            sleep 5
            reboot
            ;;

        "GUI Off")
            echo -e "${GREEN}Turning Linux GUI Off${NOCOLOR}"
            sleep 1
            systemctl set-default multi-user.target
            sleep 1
            echo -e "${GREEN}GUI Disabled${NOCOLOR}"
            sleep 1
            echo -e "${RED}Rebooting System in 5s (CTRL + C to stop reboot).${NOCOLOR}"
            sleep 5
            reboot
            ;;

        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done

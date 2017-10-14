#!/bin/bash

clear

source <(curl -s https://raw.githubusercontent.com/alectramell/beacons/master/colors.sh)

clear

PROFILE=($(curl -s https://raw.githubusercontent.com/alectramell/profiles/master/$1.txt))

clear

NAME=$(showhex "${PROFILE[0]}")
YOB=$(showhex "${PROFILE[1]}")
GEN=$(showhex "${PROFILE[2]}")
LVL=$(showhex "${PROFILE[3]}")
STATUS=$(showhex "${PROFILE[4]}")

clear

YEAR=$(date +%Y)

clear

AGE=$(echo $(($YEAR-$YOB)))

clear

echo -e "\n"
echo -n "${green}NAME:${reset} "
echo "${white}$NAME${reset}"
echo -n "${green}YOB:${reset} "
echo "${white}$YOB${reset}"
echo -n "${green}AGE:${reset} "
echo "${white}$AGE${reset}"
echo -n "${green}GEN:${reset} "
echo "${white}$GEN${reset}"
echo -n "${green}CLASS:${reset} "
if [ $LVL = "SILVER" ]
then
	echo "${sky}$LVL${reset}"

elif [ $LVL = "GOLD" ]
then
	echo "${gold}$LVL${reset}"
else
	echo "${white}$LVL${reset}"
fi
echo -n "${green}STATUS:${reset} "
if [ $STATUS = "ACTIVE" ]
then
	echo "${yellow}$STATUS${reset}"

elif [ $STATUS = "INACTIVE" ]
then
	echo "${red}$STATUS${reset}"
else
	echo ""${purple}$STATUS${reset}""
fi
echo -e "\n" | pg

clear


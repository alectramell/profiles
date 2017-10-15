#!/bin/bash

clear

source <(curl -s https://raw.githubusercontent.com/alectramell/beacons/master/colors.sh)

clear

read -p "${paper}${bold}${gold}PROFILE ID (001-999):${reset} " PROID

clear

if curl --output /dev/null --silent --head --fail "https://raw.githubusercontent.com/alectramell/profiles/master/$PROID.txt"; then

	echo "${red}ERROR${reset} ${white}PROFILE ALREADY EXISTS!${reset}"
	read -s -n1
	clear
else
	clear
	read -p "${bold}${sky}First Name (Jon/Jane):${reset} " FNAME
	read -p "${bold}${sky}Last Name (Doe):${reset} " LNAME
	read -p "${bold}${sky}Year of Birth (xxxx):${reset} " YOB
	read -p "${bold}${sky}Gender (MALE/FEMALE):${reset} " GEN
	read -p "${bold}${sky}Class (SILVER/GOLD/NONE):${reset} " CLASS
	read -p "${bold}${sky}Status (ACTIVE/INACTIVE):${reset} " STATUS
	read -p "${bold}${sky}Contact Phone Number (xxxxxxxxxx):${reset} " PHONE
	clear
	echo "${paper}${bold}${sky}..ENCODING NAME..${reset}" | pv -qL 15
	echohex "$FNAME $LNAME" > $PROID.txt
	clear
	echo "${paper}${bold}${sky}..ENCODING YEAR OF BIRTH..${reset}" | pv -qL 15
	echohex "$YOB" >> $PROID.txt
	clear
	echo "${paper}${bold}${sky}..ENCODING GENDER..${reset}" | pv -qL 15
	echohex "$GEN" >> $PROID.txt
	clear
	echo "${paper}${bold}${sky}..ENCODING CLASS..${reset}" | pv -qL 15
	echohex "$CLASS" >> $PROID.txt
	clear
	echo "${paper}${bold}${sky}..ENCODING STATUS..${reset}" | pv -qL 15
	echohex "$STATUS" >> $PROID.txt
	clear
	echo "${paper}${bold}${sky}..ENCODING CONTACT PHONE NUMBER..${reset}" | pv -qL 15
	echohex "$PHONE" >> $PROID.txt
	clear
	echo "${paper}${bold}${green}PROFILE COMPLETE! READY TO UPLOAD!${reset}" | pv -qL 20
	read -s -n1 -p "${paper}${bold}${gold}UPLOAD NOW? (y/n):${reset} " PCON
	clear
fi

if [ $PCON = "y" ]
then
	bash $(pwd)/render.sh
else
	clear
fi

clear


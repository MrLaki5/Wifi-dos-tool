#!/bin/sh
cd "${0%/*}"
workFlag=0;
version=$(cat "source/version.txt")
while [ $workFlag = 0 ]
do
	clear
	echo "================================================="
	echo "wifi tool: MrLaki5: $version"
	echo "================================================="

	echo " 0: Install packages"
	echo " 1: Select network device"
	echo " 2: Device info"
	echo " 3: Activate monitor mode"
	echo " 4: Activate monitor mode and change mac address"
	echo " 5: Change MAC address"
	echo " 6: Scan network"
	echo " 7: Select router"
	echo " 8: Kill processes using network device"
	echo " 9: Send global deauthentication"
	echo "10: Scan for network acknowledge on selected router"
	echo "11: Select dictionary"
	echo "12: Break network password from acknowledge"
	echo "13: Check broken password"
	echo "14: Exit"
	read -p "Command: " cmnd

	case $cmnd in
		0)
			./source/installPackages.sh
		;;
		1)
			./source/chooseDevice.sh
		;;
		2)
			./source/deviceInfo.sh
		;;
		3)
			./source/makeDeviceToMonitor.sh
		;;
		4)
			./source/changeMacAndMakeMonitor.sh
		;;
		5)
			./source/changeMacOnDevice.sh
		;;
		6)
			./source/scanNetwork.sh
		;;
		7)
			./source/chooseRouter.sh
		;;
		8)
			./source/killOtherProceses.sh
		;;
		9)
			./source/deauthRouter.sh
		;;
		10)
			./source/scanAck.sh
		;;
		11)
			./source/chooseDictionary.sh
		;;
		12)
			./source/crackAck.sh
		;;
		13)
			./source/checkPassword.sh
		;;
		14)
			workFlag=1
		;;
	esac

done
clear
#etc

#!/bin/sh
deviceName=$(cat "source/deviceName.txt");
version=$(cat "source/version.txt");
workFlag=0;
while [ $workFlag -eq 0 ] 
do
	clear 
	echo "================================================="
	echo "wifi tool: MrLaki5: $version"
	echo "================================================="
	echo "Processes using device $deviceName: ";
	airmon-ng check $deviceName;
	read -p "Num of process to kill (-1 to exit): " processNum
	if [ $processNum -eq -1 ]
	then
		workFlag=1;
	else
		sudo kill $processNum;
	fi
done
#etc

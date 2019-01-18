#!/bin/sh
version=$(cat "source/version.txt")
proba=$(ifconfig -a | sed -n 's/^\([^ |^:]\+\).*/\1/p') #get all devices
devices=$(echo $proba) #put string in format for looping
oldIFS="$IFS"	#set separator for for loop
IFS=' '
chFlag=0;
while [ $chFlag = 0 ]	#while device is not chosen
do
	tempCnt=0;
	clear
	echo "================================================="
	echo "wifi tool: MrLaki5: $version"
	echo "================================================="
	echo "Network devices: "
	for line in $devices;	#list all devices
	do
		echo "$tempCnt: $line"
		tempCnt=$((tempCnt+1));

	done
	read -p "Choose device: " userAns	#read user input 
	if [ \( $userAns -gt -1 \) -a \( $userAns -lt $tempCnt \) ]	#check user input
	then
		chFlag=1;
	else
		clear
	fi
done
temp2Cnt=0;
myDevice=""
for line in $devices;		#find name of chosen device
do
	if [ $temp2Cnt -eq $userAns ]
	then
		myDevice=$line;
	fi
	temp2Cnt=$((temp2Cnt+1));
done



echo $myDevice > source/deviceName.txt

IFS="$oldIFS"

#etc

#!/bin/sh
routers=$(sed -n -e '/BSSID,\sFirst\stime\sseen,\sLast\stime\sseen,\schannel,\sSpeed,\sPrivacy,\sCipher,\sAuthentication,\sPower,\s#\sbeacons,\s#\sIV,\sLAN\sIP,\sID-length,\sESSID,\sKey/,/Station\sMAC,\sFirst\stime\sseen,\sLast\stime\sseen,\sPower,\s#\spackets,\sBSSID,\sProbed\sESSIDs/ p' "source/temp/tempScanAll-01.csv" | grep ^[A-F0-9][A-F0-9]:.*$ | cut -c1-17)

channels=$(sed -n -e '/BSSID,\sFirst\stime\sseen,\sLast\stime\sseen,\schannel,\sSpeed,\sPrivacy,\sCipher,\sAuthentication,\sPower,\s#\sbeacons,\s#\sIV,\sLAN\sIP,\sID-length,\sESSID,\sKey/,/Station\sMAC,\sFirst\stime\sseen,\sLast\stime\sseen,\sPower,\s#\spackets,\sBSSID,\sProbed\sESSIDs/ p' "source/temp/tempScanAll-01.csv" | grep ^[A-F0-9][A-F0-9]:.*$ | cut -c61-63)
version=$(cat "source/version.txt");
oldIFS="$IFS"	#set separator for for loop
IFS='
'
chFlag=0;
while [ $chFlag = 0 ]	#while device is not chosen
do
	tempCnt=0;
	clear 
	echo "================================================="
	echo "wifi tool: MrLaki5: $version"
	echo "================================================="
	echo "Routers: "
	for line in $routers;	#list all routers
	do
		echo "$tempCnt: $line"
		tempCnt=$((tempCnt+1));

	done
	read -p "Choose router (-1 to exit): " userAns	#read user input 
	if [ \( $userAns -gt -1 \) -a \( $userAns -lt $tempCnt \) ]	#check user input
	then
		chFlag=1;
	else
		clear
		if [ $userAns -eq -1 ]
		then
			chFlag=1;
		fi
	fi
done
if [ $userAns -eq -1 ]
then
	echo "Exiting"
else
	temp2Cnt=0;
	myDevice=""
	for line in $routers;		#find mac of chosen router
	do
		if [ $temp2Cnt -eq $userAns ]
		then
			myDevice=$line;
		fi
		temp2Cnt=$((temp2Cnt+1));
	done
	echo $myDevice > source/routerMac.txt

	temp2Cnt=0;
	myChannel=""
	for line in $channels;		#find channel of chosen router
	do
		if [ $temp2Cnt -eq $userAns ]
		then
			myChannel=$line;
		fi
		temp2Cnt=$((temp2Cnt+1));
	done
	echo $myChannel > source/routerChannel.txt
fi
IFS="$oldIFS"
#etc

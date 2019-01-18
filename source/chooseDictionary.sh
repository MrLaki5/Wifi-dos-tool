#!/bin/sh
dictionaries=$(ls source/dictionaries)
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
	echo "Dictionaries: "
	for line in $dictionaries;	#list all dictionaries
	do
		echo "$tempCnt: $line"
		tempCnt=$((tempCnt+1));

	done
	read -p "Choose dictioner (-1 to exit): " userAns	#read user input 
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
	myDic=""
	for line in $dictionaries;		#find dictionary
	do
		if [ $temp2Cnt -eq $userAns ]
		then
			myDic=$line;
		fi
		temp2Cnt=$((temp2Cnt+1));
	done
	echo $myDic > source/dictionaryName.txt
fi
IFS="$oldIFS"
#etc

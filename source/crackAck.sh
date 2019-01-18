#!/bin/sh
deviceName=$(cat "source/deviceName.txt"); 
routerMac=$(cat "source/routerMac.txt"); 
dictionaryName=$(cat "source/dictionaryName.txt");
version=$(cat "source/version.txt");
clear 
echo "================================================="
echo "wifi tool: MrLaki5: $version"
echo "================================================="  
echo "Using device: $deviceName";
echo "Router MAC: $routerMac";
echo "Dictionary name: $dictionaryName";
temp=$(gnome-terminal -- aircrack-ng -w source/dictionaries/$dictionaryName -l source/password.txt -b $routerMac source/temp/tempAck-01.cap)
echo "Password cracking done in another terminal"
read -p "Press enter to continue..." temp
#etc

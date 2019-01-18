#!/bin/sh
deviceName=$(cat "source/deviceName.txt");
version=$(cat "source/version.txt");
clear 
echo "================================================="
echo "wifi tool: MrLaki5: $version"
echo "================================================="
echo "Using device: $deviceName";
sudo rm source/temp/tempScanAll-*;
temp1=$(gnome-terminal -- airodump-ng $deviceName -w source/temp/tempScanAll --write-interval 1 -o csv)
echo "Scaning network in another terminal"
read -p "Press enter to continue..." temp
#etc

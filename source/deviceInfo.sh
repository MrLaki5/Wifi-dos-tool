#!/bin/sh
clear
version=$(cat "source/version.txt");
deviceName=$(cat "source/deviceName.txt");
clear
echo "================================================="
echo "wifi tool: MrLaki5: $version"
echo "================================================="
iwconfig $deviceName
read -p "Press enter to continue..." temp
#etc

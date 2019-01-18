#!/bin/sh
version=$(cat "source/version.txt");
deviceName=$(cat "source/deviceName.txt");
clear 
echo "================================================="
echo "wifi tool: MrLaki5: $version"
echo "================================================="
echo "Using device: $deviceName";
ifconfig $deviceName down
echo "Device down"
iwconfig $deviceName mode monitor
echo "Monitor mode set"
ifconfig $deviceName up
echo "Device up"
read -p "Press enter to continue..." temp
#etc

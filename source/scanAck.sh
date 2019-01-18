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
sudo rm source/temp/tempAck-*;
temp=$(gnome-terminal -- airodump-ng -c $routerChannel --bssid $routerMac -w source/temp/tempAck $deviceName --ignore-negative-one)
echo "Authentication scan in another terminal"
read -p "Press enter to continue..." temp
#etc

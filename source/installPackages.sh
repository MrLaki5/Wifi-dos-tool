#!/bin/sh
version=$(cat "source/version.txt");
clear
echo "================================================="
echo "wifi tool: MrLaki5: $version"
echo "================================================="
sudo apt-get update #Update packages
sudo apt-get install aircrack-n
sudo apt-get install macchanger
read -p "Press enter to continue..." temp
#etc

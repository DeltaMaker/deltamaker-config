#!/bin/bash
#
#  This script sets the printer name, using the specified serial number.
#
if [ $# -lt 1 ]; then
    echo Usage: `basename $0` 0000 1>&2
    exit 1
fi

wifi_name="DeltaMaker_WiFi_$1"
pass_phrase="DeltaMaker3D"
hostname="deltamaker-$1"
printer_name="DeltaMaker $1"
country_code="US"

# set WiFi access point name and pass phrase
conf_file="/etc/hostapd/hostapd.conf"

sed -i -e "/^ssid=/c\ssid=$wifi_name" $conf_file
sed -i -e "/^wpa_passphrase=/c\wpa_passphrase=$pass_phrase" $conf_file
sed -i -e "/^country_code=/c\country_code=$country_code" $conf_file

#match="ssid="
#replace="ssid=$wifi_name"
#sudo sed -i "0,/$match/{s/\(.*\)$match.*$/\1$replace/}" $conf_file
#sudo grep $match $conf_file
#sudo sed -i "0,/wpa_passphrase=/{s/\(.*\)wpa_passphrase=.*$/\1wpa_passphrase=$pass_phrase/}" $conf_file
#sudo sed -i "0,/country_code=/{s/\(.*\)country_code=.*$/\1country_code=$country_code/}" $conf_file
sudo grep "^ssid" $conf_file
sudo grep "^wpa_passphrase" $conf_file
sudo grep "^country_code" $conf_file

# set the hostname in /etc/hosts & /etc/hostname
hostn=$(cat /etc/hostname)
sudo sed -i "s/$hostn/$hostname/g" /etc/hosts
sudo sed -i "s/$hostn/$hostname/g" /etc/hostname
echo "The hostname is $hostname"

#set the printer name in the OctoPrint appearance
conf_file="/home/pi/.octoprint/config.yaml"
match="name: Delta"
replace="name: $printer_name"
sed -i "0,/$match/{s/\(.*\)$match.*$/\1$replace/}" $conf_file
echo "OctoPrint: $printer_name"

echo ""
echo "Reboot required."

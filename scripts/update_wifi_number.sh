#!/bin/bash
# 6/9/2023
#
# This script updates the SID for the DeltaMaker_WiFi access point to include the
# serial number from the /boot/deltamaker.txt file.
#
dmtxt="/boot/deltamaker.txt"
if [ -f $dmtxt ]; then
    serialnumber=`awk -F= '$1=="serialnumber"{print $2}' $dmtxt`
    echo "deltamaker-$serialnumber"
fi
if [ ! $serialnumber ]; then
    echo "Error: $dmtxt not found."
else
    /home/pi/deltamaker-config/scripts/set_serial_number.sh $serialnumber 
fi

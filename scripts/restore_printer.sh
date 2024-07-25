#!/bin/bash
# 6/20/2024
#
# Klipper installation with Moonraker recommends ~/printer_data/config for printer.cfg files.
#
# This script restores the active printer.cfg files from ./deltamaker-config/example and
#  and octoprint config.yaml file from ./deltamaker-config/octoprint
#
dmtxt="/boot/deltamaker.txt"
if [ -f $dmtxt ]; then
    serialnumber=`awk -F= '$1=="serialnumber"{print $2}' $dmtxt`
    echo "deltamaker-$serialnumber"
fi
# require serial number to be included on the command line
serialnumber=$1
if [ ! $serialnumber ]; then
    echo "Serial Number missing. Must be 4-digit number"
    echo "Example usage: $0 0000"
    exit -1
fi

cd "$( dirname "${BASH_SOURCE[0]}" )" ; cd ../
dir=`pwd`

printer_cfg="/home/pi/printer_data/config/printer.cfg"
variables_cfg="/home/pi/printer_data/config/variables.cfg"
save_printer_cfg="$dir/example/printer-$serialnumber.cfg"
save_variables_cfg="$dir/example/variables-$serialnumber.cfg"
config_yaml="/home/pi/.octoprint/config.yaml"
save_config_yaml="$dir/example/config-$serialnumber.yaml"
boot_txt="/boot/deltamaker.txt"
save_boot_txt="$dir/example/deltamaker-$serialnumber.txt"

if [ -f "$save_printer_cfg" ]; then
    echo "copying $save_printer_cfg to $printer_cfg"
    cp $save_printer_cfg $printer_cfg
    echo "copying $save_variables_cfg to $variables_cfg"
    cp $save_variables_cfg $variables_cfg
else
    echo "$save_printer_cfg not found"
fi

if [ -f "$save_config_yaml" ]; then
    echo "copying $save_config_yaml to $config_yaml"
    cp $save_config_yaml $config_yaml
else
    echo "$save_config_yaml not found"
fi

if [ -f "$save_boot_txt" ]; then
    echo "copying $save_boot_txt to $boot_txt"
    sudo cp $save_boot_txt $boot_txt
else
    echo "$save_boot_txt not found"
fi

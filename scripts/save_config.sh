#!/bin/bash
# 5/26/2023
#
# This script copies the active printer.cfg files to ./deltamaker-config/example and
#  and octoprint config.yaml file to ./deltamaker-config/octoprint
#
dmtxt="/boot/deltamaker.txt"
if [ ! -f $dmtxt ]; then
    echo "Error: $dmtxt not found"
    exit -1
fi

serialnumber=`awk -F= '$1=="serialnumber"{print $2}' $dmtxt`
cd "$( dirname "${BASH_SOURCE[0]}" )" ; cd ../
dir=`pwd`

printer_cfg="/home/pi/printer.cfg"
variables_cfg="/home/pi/variables.cfg"
save_printer_cfg="$dir/example/printer-$serialnumber.cfg"
save_variables_cfg="$dir/example/variables-$serialnumber.cfg"
config_yaml="/home/pi/.octoprint/config.yaml"
save_config_yaml="$dir/example/config-$serialnumber.yaml"
boot_txt="/boot/deltamaker.txt"
save_boot_txt="$dir/example/deltamaker-$serialnumber.txt"
printer_profile="/home/pi/.octoprint/printerProfiles/_default.profile"
save_printer_profile="$dir/example/default-$serialnumber.profile"

if [ -f "$printer_cfg" ]; then
    echo "copying $printer_cfg to $save_printer_cfg"
    cp $printer_cfg $save_printer_cfg
    echo "copying $variables_cfg to $save_variables_cfg"
    cp $variables_cfg $save_variables_cfg
else
    echo "$printer_cfg not found"
fi

if [ -f "$config_yaml" ]; then
    echo "copying $config_yaml to $save_config_yaml"
    cp $config_yaml $save_config_yaml
else
    echo "$config_yaml not found"
fi
if [ -f "$printer_profile" ]; then
    echo "copying $printer_profile to $save_printer_profile"
    cp $printer_profile $save_printer_profile
else
    echo "$printer_profile not found"
fi

if [ -f "$boot_txt" ]; then
    echo "copying $boot_txt to $save_boot_txt"
    cp $boot_txt $save_boot_txt
else
    echo "$boot_txt not found"
fi

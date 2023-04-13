#!/bin/bash
# This script copies the deltamaker printer config and octoprint config files to
#  the required locations
#
dm_cfg="2t"
printer_cfg="/home/pi/printer.cfg"
config_yaml="/home/pi/.octoprint/config.yaml"

cd "$( dirname "${BASH_SOURCE[0]}" )"
deltamaker_config="../config/printer-deltamaker-${dm_cfg}.cfg"
octoprint_config="../octoprint/config.yaml"
if [ -f "$printer_cfg" ]; then
    echo "Exiting: $printer_cfg already exists"
    exit -1
fi

if [ -f "$deltamaker_config" ]; then
    echo "Installing $deltamaker_config as $printer_cfg"
    cp --no-clobber $deltamaker_config $printer_cfg
else
    echo "$deltamaker_config not found"
fi

if [ -f "$octoprint_config" ]; then
    echo "Installing $octoprint_config as $config_yaml"
    cp $octoprint_config $config_yaml
else
    echo "$octoprint_config not found"
fi

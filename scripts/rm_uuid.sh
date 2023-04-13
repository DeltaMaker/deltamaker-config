#!/bin/bash
#
# Remove the uuid from the Octoprint discovery plug-in config
#
uuid=$(grep "upnpUuid" /home/pi/.octoprint/config.yaml | cut -d: -f2)
echo "Remove UUID" $uuid
sed -i /upnpUuid/d /home/pi/.octoprint/config.yaml
#sudo service octoprint restart

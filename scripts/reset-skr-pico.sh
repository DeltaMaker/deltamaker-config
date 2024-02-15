#!/bin/bash
# Toggle GPIO26 to reset the SKR Pico board
raspi-gpio set 26 op
raspi-gpio set 26 dl
raspi-gpio set 26 ip
sleep 1


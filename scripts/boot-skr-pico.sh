#!/bin/bash
# Wiring GPIO26 connected to SKR Pico RESET pin,
#  GPIO19 connected to SKR Pico BOOT jumper
# Pull GPIO19 low and Toggle GPIO26 to set board to USB Boot mode.
raspi-gpio set 19 op
raspi-gpio set 19 dl
raspi-gpio set 26 op
raspi-gpio set 26 dl
raspi-gpio set 26 ip
sleep 0.5
raspi-gpio set 19 ip
sleep 1


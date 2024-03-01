#!/bin/bash
# Wiring GPIO26 connected to SKR Pico RESET pin, and
#  GPIO19 connected to SKR Pico BOOT jumper
# Pull GPIO19 low and Toggle GPIO26 to set board to USB Boot mode.
# Exit with GPIO19 and GPIO26 set to high
raspi-gpio set 19 op
raspi-gpio set 19 dl
raspi-gpio set 26 op
raspi-gpio set 26 dl
raspi-gpio set 26 dh  # was ip
sleep 0.5
raspi-gpio set 19 dh  # was ip
sleep 1


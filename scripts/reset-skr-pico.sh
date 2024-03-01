#!/bin/bash
# Wiring GPIO26 connected to SKR Pico RESET pin, and
#  GPIO19 connected to SKR Pico BOOT jumper
# Toggle GPIO26 to reset the SKR Pico board
# Exit with GPIO19 and GPIO26 set to high
raspi-gpio set 26 op
raspi-gpio set 26 dl
raspi-gpio set 26 dh  # was ip
raspi-gpio set 19 op
raspi-gpio set 19 dh
sleep 1

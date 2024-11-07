#!/bin/bash
# Wiring GPIO26 connected to SKR Pico RESET pin,
# Katapult boot loader - double press reset
raspi-gpio set 26 op
raspi-gpio set 26 dl
raspi-gpio set 26 ip
sleep 0.15
raspi-gpio set 26 op
raspi-gpio set 26 dl
raspi-gpio set 26 ip
sleep 1


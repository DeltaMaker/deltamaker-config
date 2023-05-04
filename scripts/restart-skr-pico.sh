#!/bin/bash
#
# https://github.com/Drachenkaetzchen/VoronMisc/blob/main/SKR-Pico-Reset.md

raspi-gpio set 26 op
raspi-gpio set 26 dl
raspi-gpio set 26 dh
sleep 1

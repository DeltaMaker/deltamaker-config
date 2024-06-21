#!/usr/bin/env python
# encoding: utf-8

from usbenum import usbenum
import os
import subprocess
import time
import octoapi

def bash(runcmd):
    subprocess.call(runcmd.split())

def findFTDI():
    for i in usbenum():
        if i["id"].split(":")[0] == "0403": #Manufacturer ID for FTDI
            return i["device"]

firmwareHex = "/home/pi/klipper/out/klipper.hex"
usbRSTcmd = "sudo /home/pi/deltamaker_config/scripts/azteeg/usbreset " + findFTDI()
flashFirmware = ["avrdude -p m2560 -c stk500v2 -P /dev/ttyUSB0 -U flash:w:"+firmwareHex+" -D"]

def main():
    if os.path.exists(firmwareHex):
        print ("Flashing procedure started!")
        octoapi.cmd(octoapi.disconnect) #Shut up OctoPrint!
        time.sleep(2)     #Wait 2 seconds for OctoPrint to shut up.
        bash(usbRSTcmd)   #Hard-reset the USB device.  Drop that sucker off the face of the planet.
        time.sleep(4)     #Wait a sec for UDEV to set up /dev/ttyUSBDM
        bash(flashFirmware[0])   # Flash firmware
        time.sleep(4)     #Wait for things to settle down again. Don't upset the 3D printer gods.
        octoapi.cmd(octoapi.connect)    #You can talk now, cthulu!
    else:
        print ("Firmware not found: " +firmwareHex)


if __name__ == '__main__':
	main()


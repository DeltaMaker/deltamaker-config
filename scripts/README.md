
# SKR-PICO v1.0 Bug Fix

### Install a service to Reset the SKR Pico when the RPi boots.

	cd ~/deltamaker-config/
	sudo cp ./scripts/reset-skr-pico.sh /usr/local/bin/
	sudo cp ./scripts/reset-skr-pico.service /etc/systemd/system/
	sudo systemctl enable --now reset-skr-pico.service



### KlipperScreen Fix

	sudo systemctl disable ModemManager.service

Next, reboot the pi.
Apparently, there are conflicts with klipperScreen.


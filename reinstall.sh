#!/bin/bash
# 
# Sync a standard Klipper install with the lastest commit in master.

# Navigate to standard Klipper install.
cd ~/klipper

# Pull the latest code on master.
git pull origin master

# Update Pi installation as prescribed in the Klipper documentation.
~/klipper/scripts/install-octopi.sh

# Compile any updates.
make clean
make

# Stop Klipper service.
sudo service klipper stop

# Flash the new firmware that we compiled earlier.
make flash FLASH_DEVICE=/dev/ttyUSB0

# Start the Klipper service with new firmware.
sudo service klipper start

# Error handling.
# Exit immediately if a command fails.
set -o nounset
set -o errexit

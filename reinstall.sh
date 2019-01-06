#!/bin/bash
#
# Sync a standard Klipper install with the lastest commit in master.


# Default variables for standard Klipper installations.
# YOU MAY MODIFY THESE FOR CUSTOM INSTALLATIONS.
USB_DEVICE="/dev/ttyUSB0"
CONFIG_FILENAME="printer.cfg"

# !!!
# WARNING: DO NOT MODIFY ANYTHING BELOW THIS LINE UNLESS YOU KNOW WHAT YOU'RE DOING
#!!!!

bold=`tput smso`
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0 && tput rmso`
datetime=$(date '+%Y%m%d_%H%M%S')
backup_filename="klipper-${datetime}.tar.gz"

echo -e "${green}\n===\nBacking up your Klipper installation to ${backup_filename}...\n===${reset}"

# Save a backup of the current klipper installation.
# Example filename: klipper_20190106_090208.tar.gz
tar -zcf ${backup_filename} ~/klipper

echo -e "${green}\n===\nUpdating Klipper Codebase...\n===${reset}"

# Navigate to standard Klipper install.
cd ~/klipper

# Pull the latest code on master.
git pull origin master --quiet

# Only build and flash firmware if the working tree has changed.
if git diff-index --quiet HEAD --; then
  echo -e "\n${green}===\nUpdating Klipper...\n===${reset}"

  # Update Pi installation as prescribed in the Klipper documentation.
  scripts/install-octopi.sh

  # Compile updates.
  make clean
  make

  # Stop Klipper service in order to flash the firmware.
  sudo service klipper stop

  # Flash the new firmware that we compiled earlier.
  make flash FLASH_DEVICE=${USB_DEVICE}

  # Start the Klipper service with new firmware.
  sudo service klipper start
  echo -e "${green}===\nUpdate Complete...\n===${reset}"
else
  echo -e "${red}===\nNo updates found.\n===${reset}"
  echo -e "${green}===\nYour installation is currently up-to-date.\n===${reset}"
fi

# Error handling.
# Exit immediately if a command fails.
set -o nounset
set -o errexit

cd ~/klipper
git pull
~/klipper/scripts/install-octopi.sh

make clean
make

sudo service klipper stop
make flash FLASH_DEVICE=/dev/ttyUSB0
sudo service klipper start

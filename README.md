# 🖨️ Ender3 + BLTouch + Klipper Configuration

[@droxey](https://github.com/droxey)'s collection of sliced print files for the [Ender3](https://www.creality3d.shop/collections/3d-printer/products/creality-ender-3-3d-printer-economic-ender-diy-kits-with-resume-printing-function-v-slot-prusa-i3-220x220x250mm) 3D printer running the [Klipper](https://github.com/KevinOConnor/klipper/) firmware.

## Install Update Script

1. Navigate to the home directory.

```bash
$ cd ~
```

1. Download the script.

```bash
$ wget -O updateklipper https://raw.githubusercontent.com/droxey/3d/master/reinstall.sh
```

1. Make it executable.

```bash
$ chmod +x updateklipper.sh
```

1. Execute `./updateklipper` in your home directory to completely update your installation. Successful sample output below provided for debugging purposes.

```bash
pi@octopi:~ $ ./updateklipper
remote: Enumerating objects: 65, done.
remote: Counting objects: 100% (65/65), done.
remote: Compressing objects: 100% (14/14), done.
remote: Total 65 (delta 51), reused 65 (delta 51), pack-reused 0
Unpacking objects: 100% (65/65), done.
From https://github.com/KevinOConnor/klipper
   24fe606..186d815  master     -> origin/master
 + 310affa...8b5b6fb work-bltouch-debug-20181211 -> origin/work-bltouch-debug-20181211  (forced update)
Updating 24fe606..186d815
Fast-forward
 config/generic-ramps.cfg       |  1 +
 docs/BLTouch.md                | 64 ++++++++++++++++++++++++++++++++++++++++++
 docs/FAQ.md                    | 10 +++++--
 docs/G-Codes.md                |  2 ++
 klippy/extras/bus.py           |  7 +++--
 klippy/extras/display/menu.cfg |  2 +-
 6 files changed, 80 insertions(+), 6 deletions(-)
 create mode 100644 docs/BLTouch.md


###### Running apt-get update...
Hit:1 http://archive.raspberrypi.org/debian stretch InRelease
Get:2 http://raspbian.raspberrypi.org/raspbian stretch InRelease [15.0 kB]
Fetched 15.0 kB in 1s (11.8 kB/s)
Reading package lists... Done


###### Installing packages...
Reading package lists... Done
Building dependency tree
Reading state information... Done
Note, selecting 'libncurses5-dev' instead of 'libncurses-dev'
binutils-arm-none-eabi is already the newest version (2.27-9+9).
build-essential is already the newest version (12.3).
gcc-arm-none-eabi is already the newest version (15:5.4.1+svn241155-1).
libffi-dev is already the newest version (3.2.1-6).
libncurses5-dev is already the newest version (6.0+20161126-1+deb9u2).
libnewlib-arm-none-eabi is already the newest version (2.4.0.20160527-2).
libusb-dev is already the newest version (2:0.1.12-30).
python-dev is already the newest version (2.7.13-2).
python-virtualenv is already the newest version (15.1.0+ds-1).
stm32flash is already the newest version (0.5-1).
virtualenv is already the newest version (15.1.0+ds-1).
avr-libc is already the newest version (1:2.0.0+Atmel3.6.1-1~rpt1).
avrdude is already the newest version (6.3+r1425-1+rpt1).
binutils-avr is already the newest version (2.26.20160125+Atmel3.6.1-1~rpt1).
gcc-avr is already the newest version (1:5.4.0+Atmel3.6.1-1~rpt1).
0 upgraded, 0 newly installed, 0 to remove and 113 not upgraded.


###### Updating python virtual environment...
Looking in indexes: https://pypi.org/simple, https://www.piwheels.org/simple
Requirement already satisfied: cffi==1.6.0 in /home/pi/klippy-env/lib/python2.7/site-packages (1.6.0)
Requirement already satisfied: pyserial==3.2.1 in /home/pi/klippy-env/lib/python2.7/site-packages (3.2.1)
Requirement already satisfied: greenlet==0.4.10 in /home/pi/klippy-env/lib/python2.7/site-packages (0.4.10)
Requirement already satisfied: pycparser in /home/pi/klippy-env/lib/python2.7/site-packages (from cffi==1.6.0) (2.19)


###### Launching Klipper host software...
[ ok ] Restarting klipper (via systemctl): klipper.service.
  Build Kconfig config file
  Creating symbolic link out/board
  Compiling out/src/sched.o
  Compiling out/src/command.o
  Compiling out/src/basecmd.o
  Compiling out/src/debugcmds.o
  Compiling out/src/gpiocmds.o
  Compiling out/src/stepper.o
  Compiling out/src/endstop.o
  Compiling out/src/adccmds.o
  Compiling out/src/spicmds.o
  Compiling out/src/thermocouple.o
  Compiling out/src/i2ccmds.o
  Compiling out/src/pwmcmds.o
  Compiling out/src/lcd_st7920.o
  Compiling out/src/lcd_hd44780.o
  Compiling out/src/buttons.o
  Compiling out/src/tmcuart.o
  Compiling out/src/avr/main.o
  Compiling out/src/avr/timer.o
  Compiling out/src/avr/gpio.o
  Compiling out/src/avr/adc.o
  Compiling out/src/avr/spi.o
  Compiling out/src/avr/i2c.o
  Compiling out/src/avr/hard_pwm.o
  Compiling out/src/avr/watchdog.o
  Compiling out/src/avr/serial.o
  Compiling out/src/generic/serial_irq.o
  Building out/compile_time_request.o
Version: v0.7.0-31-g186d815-20190106_043823-octopi
  Linking out/klipper.elf
  Creating hex file out/klipper.elf.hex
  Flashing out/klipper.elf.hex to /dev/ttyUSB0 via avrdude

avrdude: AVR device initialized and ready to accept instructions

Reading | ################################################## | 100% 0.00s

avrdude: Device signature = 0x1e9705 (probably m1284p)
avrdude: reading input file "out/klipper.elf.hex"
avrdude: writing flash (20500 bytes):

Writing | ################################################## | 100% 3.87s

avrdude: 20500 bytes of flash written
avrdude: verifying flash memory against out/klipper.elf.hex:
avrdude: load data flash data from input file out/klipper.elf.hex:
avrdude: input file out/klipper.elf.hex contains 20500 bytes
avrdude: reading on-chip flash data:

Reading | ################################################## | 100% 4.43s

avrdude: verifying ...
avrdude: 20500 bytes of flash verified

avrdude: safemode: Fuses OK (E:00, H:00, L:00)

avrdude done.  Thank you.
```

### Debugging Script Output

#### Setting Locale

You may receive the following in your output if you've failed to set your locale properly:

```bash
###### Installing system start script...
perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
	LANGUAGE = (unset),
	LC_ALL = (unset),
	LC_CTYPE = "en_US.UTF-8",
	LANG = "en_GB.UTF-8"
    are supported and installed on your system.
perl: warning: Falling back to a fallback locale ("en_GB.UTF-8").
```

Run the following commands to remove the warning. Uncomment `en_US.UTF-8` by removing the `#` before it's entry in the file, then save it. Output provided for reference:

```bash
pi@octopi:~ $ sudo nano /etc/locale.gen
pi@octopi:~ $ sudo locale-gen en_US.UTF-8
Generating locales (this might take a while)...
  en_GB.UTF-8... done
  en_US.UTF-8... done
Generation complete.
pi@octopi:~ $ sudo update-locale en_US.UTF-8
```

## Calibrate Hotend

```gcode
PID_CALIBRATE HEATER=extruder TARGET=230
```

## Calibrate Bed

```gcode

PID_CALIBRATE HEATER=heater_bed TARGET=50
```

## Enabling Pressure Advance

```gcode
SET_VELOCITY_LIMIT SQUARE_CORNER_VELOCITY=1 ACCEL=500
SET_PRESSURE_ADVANCE ADVANCE_LOOKAHEAD_TIME=0
SET_PRESSURE_ADVANCE ADVANCE=0.000
SET_PRESSURE_ADVANCE ADVANCE=0.050
SET_PRESSURE_ADVANCE ADVANCE=0.080
```

## Calibrate Extruder (Klipper = `mm/step`)

1. Mark filament 120mm above the entry to extruder.
1. Heat up the nozzle to desired printing temperature.
1. Home all axis.
1. Lift nozzle by 50mm (to make room for the filament!)
1. Execute the following commands (one by one)
    1. `G92 E0` This resets the "extruded material" value to 0.
    1. `G1 E100 F100` This extrudes 100mm filament with 100mm/min.
1. Now measure the distance between extruder entry and the mark on the filament. For example, if it is 28mm instead of 20mm (120mm - 100mm) then the extruder is underextruding by 8mm ==> 92mm instead of 100mm. If it shows 15mm then the extruder is OVERextruding by 5mm ==> 105mm.

* `c` := current value in `printer.cfg`
* `m` := measured left over filament
* `d` := desired mm
* `n` := new value for `printer.cfg`

* `((120 - m) / d) * c = n`
* `((120 - 28) / 100) * 0.010500 = 0,009660`
* `(92 / 100) * 0.010500 = 0,009660`

For underextrusion, the new value is lower than the old one. Play around with the last two numbers to fine tune.

## Install and Configure BLTouch Hardware

Information and docs [found here](https://andrivet.github.io/ADVi3pp-User-Manual/03-BLTouch.html). 

# 🖨️ 3d

[@droxey](https://github.com/droxey)'s collection of sliced print files for the [Ender3](https://www.creality3d.shop/collections/3d-printer/products/creality-ender-3-3d-printer-economic-ender-diy-kits-with-resume-printing-function-v-slot-prusa-i3-220x220x250mm) 3D printer running the [Klipper](https://github.com/KevinOConnor/klipper/) firmware.


## How to Calibrate Z-Offset:
1. Home 3D printer
1. `M851 Z0` - Reset Z0Offset
1. `M500` - Store setting to eeprom
1. `M501` - Set active parameters
1. `M503` - Display Active Parameters
1. `G28 Z`  - Home Z Axis
1. `G1 F60 Z0` - Move nozzle to true 0 offset
1. `M211 S0` - Switch off soft endstops
1. Move nozzle towards bed slowly until the paper can barely move
1. Take note of the Z on the printer display (take that number and add the measurment of the calibration sheet or device used)
1.` M851 Z X.XX` (X.XX being your z offset achieved)
1. `M211 S1` - Enable Soft Endstops
1. `M500` - Save settings to Eeprom
1. `M501` - Set Active Parameters
1. `M503` - display current settings

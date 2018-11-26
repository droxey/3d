# 🖨️ 3d

[@droxey](https://github.com/droxey)'s collection of sliced print files for the [Ender3](https://www.creality3d.shop/collections/3d-printer/products/creality-ender-3-3d-printer-economic-ender-diy-kits-with-resume-printing-function-v-slot-prusa-i3-220x220x250mm) 3D printer running the [Klipper](https://github.com/KevinOConnor/klipper/) firmware.

## How to Calibrate Hotend

```gcode
PID_CALIBRATE HEATER=extruder TARGET=230
```

## How to Calibrate Bed

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


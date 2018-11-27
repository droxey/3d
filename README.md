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

## Measure Extruder Steps (Klipper = `mm/step`)

1. Mark filament 120mm above the entry to extruder.
1. Heat up the nozzle to desired printing temperature.
1. Home all axis.
1. Lift nozzle by 50mm (to make room for the filament!)
1. Execute the following commands (one by one)
    1. `G92 E0` This resets the "extruded material" value to 0.
    1. `G1 E100 F100` This extrudes 100mm filament with 100mm/min.
1. Now measure the distance between extruder entry and the mark on the filament. For example, if it is 28mm instead of 20mm (120mm - 100mm) then the extruder is underextruding by 8mm ==> 92mm instead of 100mm. If it shows 15mm then the extruder is OVERextruding by 5mm ==> 105mm.

`c` := current value in `printer.cfg`
`m` := measured left over filament
`d` := desired mm
`n` := new value for `printer.cfg`

`((120 - m) / d) * c = n`
`((120 - 28) / 100) * 0.010500 = 0,009660`
`(92 / 100) * 0.010500 = 0,009660`

For underextrusion, the new value is lower than the old one. Play around with the last two numbers to fine tune.

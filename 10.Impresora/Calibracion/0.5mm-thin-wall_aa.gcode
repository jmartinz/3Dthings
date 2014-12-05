M109 T0 S185.000000
T0
;Sliced ?filename? at: Sat 29-11-2014 18:37:34
;Basic settings: Layer height: 0.3 Walls: 1 Fill: 50
;Print time: #P_TIME#
;Filament used: #F_AMNT#m #F_WGHT#g
;Filament cost: #F_COST#
G21        ;metric values
G90        ;absolute positioning
M107       ;start with the fan off
G28 X0 Y0  ;move X/Y to min endstops
G28 Z0     ;move Z to min endstops
G92 X0 Y0 Z0 E0         ;reset software position to front/left/z=0.0
G1 Z15.0 F?max_z_speed? ;move the platform down 15mm
G92 E0                  ;zero the extruded length
G1 F200 E3              ;extrude 3mm of feed stock
G92 E0                  ;zero the extruded length again
G1 F9000

;Layer count: 33
;LAYER:0
M107
;LAYER:1
;LAYER:2
;LAYER:3
;LAYER:4
;LAYER:5
;LAYER:6
;LAYER:7
;LAYER:8
;LAYER:9
;LAYER:10
;LAYER:11
;LAYER:12
;LAYER:13
;LAYER:14
;LAYER:15
;LAYER:16
;LAYER:17
;LAYER:18
;LAYER:19
;LAYER:20
;LAYER:21
;LAYER:22
;LAYER:23
;LAYER:24
;LAYER:25
;LAYER:26
;LAYER:27
;LAYER:28
;LAYER:29
;LAYER:30
;LAYER:31
;LAYER:32
G1 F1800 E-2.00000
G0 F9000 X0.000 Y0.000 Z15.000
;End GCode
M104 S0                     ;extruder heater off
M140 S0                     ;heated bed heater off (if you have it)
G91                                    ;relative positioning
G1 E-1 F300                            ;retract the filament a bit before lifting the nozzle, to release some of the pressure
G1 Z+0.5 E-5 X-20 Y-20 F9000 ;move Z up a bit and retract filament even more
G28 X0 Y0                              ;move X/Y to min endstops, so the head is out of the way
M84                         ;steppers off
G90                         ;absolute positioning


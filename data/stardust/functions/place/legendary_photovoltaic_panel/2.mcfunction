setblock ~ ~ ~ minecraft:daylight_detector
summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_LegendaryPhotovoltaicPanel","EF_Use","EF_CanSend","SF_SetNew"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013250}}}
execute as @e[type=minecraft:glow_item_frame,tag=EF_Wire,distance=..2] at @s run function energy_flux:wire_update
kill @s
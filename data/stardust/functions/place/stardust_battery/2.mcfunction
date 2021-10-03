execute store result score EF_Next EF_kJ run data get block ~ ~ ~ Items[0].tag.Energy
setblock ~ ~ ~ diamond_block
summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_StardustBattery","EF_Use","EF_CanReceive","EF_CanSend","SF_SetNew"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013253}}}
execute as @e[type=#energy_flux:entities,tag=EF_Wire,distance=..2] at @s run function energy_flux:wire_update
kill @s

execute store result score EF_Next EF_kJ run data get block ~ ~ ~ Items[0].tag.Energy
setblock ~ ~ ~ barrel[facing=down]{CustomName:'[{"text":"Quarry Lv.5 (5 block/s)"}]'}
data modify block ~ ~ ~ Lock set value ""
summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_DestroyBarrel","SF_Quarry","SF_QuarryLv5","EF_Use","EF_CanReceive","SF_SetNew"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013217}}}
execute as @e[type=#energy_flux:entities,tag=EF_Wire,distance=..2] at @s run function energy_flux:wire_update
kill @s

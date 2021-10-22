execute store result score EF_Next EF_kJ run data get block ~ ~ ~ Items[0].tag.Energy
setblock ~ ~ ~ barrel[facing=down]{CustomName:'[{"text":"Creative Quarry (50 block/s)"}]'}
data modify block ~ ~ ~ Lock set value ""
summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_DestroyBarrel","SF_Quarry","SF_QuarryLv6","EF_Use","EF_CanReceive","SF_SetNew"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013218,Enchantments:[{lvl:0,id:"minecraft:protection"}]}}}
execute as @e[type=#energy_flux:wires,tag=EF_Wire,distance=..2] at @s run function energy_flux:wire_update
kill @s

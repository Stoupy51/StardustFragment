setblock ~ ~ ~ minecraft:deepslate_cobbled
summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_CavernPortal","SF_Portal","EF_Use","EF_CanReceive","SF_SetNew"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013219}}}
execute as @e[type=minecraft:glow_item_frame,tag=EF_Wire,tag=!SF_Wire,distance=..2] at @s run function simplenergy:visual/wire_update
execute as @e[type=minecraft:glow_item_frame,tag=EF_Wire,tag=SF_Wire,distance=..2] at @s run function stardust:visual/wire_update
kill @s

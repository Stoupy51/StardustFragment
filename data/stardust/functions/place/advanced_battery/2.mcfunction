execute store result score EF_Next EF_Joule run data get block ~ ~ ~ Items[0].tag.Energy
setblock ~ ~ ~ barrel[facing=down]{CustomName:'[{"text":"Advanced Battery"}]'}
data modify block ~ ~ ~ Lock set value ""
summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SE_Destroyer","SE_AdvancedBattery","EF_Use","EF_CanReceive","EF_CanSend","SE_SetNew"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"cobblestone",Count:1b,tag:{CustomModelData:2012101}}}
execute as @e[type=minecraft:glow_item_frame,tag=EF_Wire,distance=..2] at @s run function stardust:visual/wire_update
kill @s

setblock ~ ~ ~ minecraft:redstone_block
summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_DestroyRedstoneBlock","SF_DungeonPortal","SF_Portal","EF_Use","EF_CanReceive","SF_SetNew"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013222}}}
function energy_flux:wire_update
kill @s

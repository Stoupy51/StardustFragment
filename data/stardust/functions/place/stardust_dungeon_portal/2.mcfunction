setblock ~ ~ ~ minecraft:redstone_block
summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_DestroyRedstoneBlock","SF_DungeonPortal","SF_Portal","energy.receive","SF_SetNew"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013222}}}
#Call on a new machine to initialize its connections
execute align xyz as @e[type=glow_item_frame,dx=0,dy=0,dz=0,limit=1,tag=SF_SetNew,tag=!energy.cable] at @s run function energy:v1/api/init_machine
kill @s

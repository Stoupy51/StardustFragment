setblock ~ ~ ~ redstone_block
summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_DestroyRedstoneBlock","SF_AwakenedStardustBattery","energy.receive","energy.send","SF_SetNew"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013254}}}
kill @s

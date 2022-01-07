setblock ~ ~ ~ minecraft:iron_block
summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["StardustFragment_Destroyer","StardustFragment_DestroyIronBlock","StardustFragment_Elevator","energy.receive","StardustFragment_SetNew"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013233}}}
kill @s

setblock ~ ~ ~ barrel[facing=down]{CustomName:'[{"text":"Quarry Lv.1 (1 block/s)"}]'}
data modify block ~ ~ ~ Lock set value ""
summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["global.ignore","global.ignore.kill","smithed.block","StardustFragment_Destroyer","StardustFragment_DestroyBarrel","StardustFragment_Quarry","StardustFragment_QuarryLv1","energy.receive","StardustFragment_SetNew","StardustFragment_Forceload","global.forceload"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013213}}}
kill @s

setblock ~ ~ ~ barrel[facing=down]{CustomName:'[{"text":"Quarry Lv.3 (3 block/s)"}]'}
data modify block ~ ~ ~ Lock set value ""
summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["StardustFragment_Destroyer","StardustFragment_DestroyBarrel","StardustFragment_Quarry","StardustFragment_QuarryLv3","energy.receive","StardustFragment_SetNew","StardustFragment_Forceload","global.forceload"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013215}}}
kill @s

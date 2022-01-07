setblock ~ ~ ~ barrel[facing=down]{CustomName:'[{"text":"Creative Quarry (50 block/s)"}]'}
data modify block ~ ~ ~ Lock set value ""
summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["StardustFragment_Destroyer","StardustFragment_DestroyBarrel","StardustFragment_Quarry","StardustFragment_QuarryLv6","energy.receive","StardustFragment_SetNew","SimplEnergy_Forceload","global.forceload"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013218,Enchantments:[{lvl:0,id:"minecraft:protection"}]}}}
kill @s

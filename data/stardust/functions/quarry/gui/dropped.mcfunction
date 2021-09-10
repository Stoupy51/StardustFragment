summon item ~ ~ ~ {Item:{id:"minecraft:cobblestone",Count:1b,tag:{SE_CustomTextureItem:1s}},Tags:["SF_Drop"]}
data modify entity @e[type=item,limit=1,distance=..1,sort=nearest,tag=SF_Drop] Item set from storage stardust:items Drop
kill @e[type=item,nbt={Item:{tag:{SE_CustomTextureItem:1s}}},limit=1,distance=..1,sort=nearest]
data remove storage stardust:items Drop

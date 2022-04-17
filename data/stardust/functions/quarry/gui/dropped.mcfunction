
summon item ~ ~ ~ {Item:{id:"minecraft:cobblestone",Count:1b,tag:{simplenergy:{texture_item:1b}}},Tags:["stardust.drop"]}
data modify entity @e[type=item,tag=stardust.drop,limit=1,distance=..1] Item set from storage stardust:main dropped_item
tag @e[type=item,tag=stardust.drop,distance=..1] remove stardust.drop
kill @e[type=item,nbt={Item:{tag:{simplenergy:{texture_item:1b}}}},limit=1,distance=..1,sort=nearest]
data remove storage stardust:main dropped_item

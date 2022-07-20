
summon item ~ ~ ~ {Item:{id:"minecraft:cobblestone",Count:1b,tag:{simplenergy:{texture_item:1b}}},Tags:["simplenergy.drop"]}
data modify entity @e[type=item,tag=simplenergy.drop,limit=1,distance=..1] Item set from storage stardust:main dropped_item
kill @e[type=item,nbt={Item:{tag:{simplenergy:{texture_item:1b}}}},distance=..1]
tag @e[type=item,tag=simplenergy.drop,distance=..1] remove simplenergy.drop
data remove storage stardust:main dropped_item

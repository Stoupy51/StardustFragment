summon item ~ ~ ~ {Item:{id:"minecraft:cobblestone",Count:1b,tag:{simplenergy:{texture_item:1b}}},Tags:["stardust.drop"]}
data modify entity @e[type=item,limit=1,distance=..1,sort=nearest,tag=stardust.drop] Item set from storage stardust:items all.Drop
kill @e[type=item,nbt={Item:{tag:{simplenergy:{texture_item:1b}}}},limit=1,distance=..1,sort=nearest]
data remove storage stardust:items all.Drop

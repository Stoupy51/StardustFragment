#Replace the item to keep Motion
    execute as @s[tag=SF_CobblestoneMinerLv1] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobbled_deepslate"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013208
    execute as @s[tag=SF_CobblestoneMinerLv2] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobbled_deepslate"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013209
    execute as @s[tag=SF_CobblestoneMinerLv3] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobbled_deepslate"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013210
    execute as @s[tag=SF_CobblestoneMinerLv4] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobbled_deepslate"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013211
    execute as @s[tag=SF_CobblestoneMinerLv5] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobbled_deepslate"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013212
kill @s

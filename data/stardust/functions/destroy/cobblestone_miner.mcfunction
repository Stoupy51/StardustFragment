#Replace the item to keep Motion
    execute if entity @s[tag=SF_CobblestoneMinerLv1] run data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:deepslate_cobbled"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013208
    execute if entity @s[tag=SF_CobblestoneMinerLv2] run data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:deepslate_cobbled"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013209
    execute if entity @s[tag=SF_CobblestoneMinerLv3] run data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:deepslate_cobbled"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013210
    execute if entity @s[tag=SF_CobblestoneMinerLv4] run data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:deepslate_cobbled"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013211
    execute if entity @s[tag=SF_CobblestoneMinerLv5] run data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:deepslate_cobbled"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013212
kill @s

#Replace the item to keep Motion
    execute if entity @s[tag=SF_SeedDone] run data modify entity @e[type=minecraft:item,tag=SF_Drop,limit=1] Item set from storage stardust:items 2013000
    data modify entity @e[type=minecraft:item,nbt={Item:{tag:{SF_StardustFragment:1b}}},limit=1,sort=nearest,distance=..1,tag=SF_Drop] Item.Count set value 16b
    execute unless entity @s[tag=SF_SeedDone] run data modify entity @e[type=minecraft:item,tag=SF_Drop,limit=1] Item set from storage stardust:items 2013202

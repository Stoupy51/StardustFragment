#Replace the item to keep Motion
    execute if entity @s[tag=SF_SeedDone] run data modify entity @e[type=minecraft:item,tag=SF_Drop,limit=1] Item set from storage stardust:items 2013001
    data modify entity @e[type=minecraft:item,nbt={Item:{tag:{SF_StardustIngot:1b}}},limit=1,sort=nearest,distance=..1,tag=SF_Drop] Item.Count set value 4b
    execute unless entity @s[tag=SF_SeedDone] run data modify entity @e[type=minecraft:item,tag=SF_Drop,limit=1] Item set from storage stardust:items 2013203

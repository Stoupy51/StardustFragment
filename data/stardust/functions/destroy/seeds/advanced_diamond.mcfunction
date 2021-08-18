#Replace the item to keep Motion
    execute if entity @s[tag=SF_SeedDone] run data modify entity @e[type=minecraft:item,tag=SF_Drop,limit=1] Item set value {id:"minecraft:diamond",Count:54b}
    execute unless entity @s[tag=SF_SeedDone] run data modify entity @e[type=minecraft:item,tag=SF_Drop,limit=1] Item set from storage stardust:items 2013201

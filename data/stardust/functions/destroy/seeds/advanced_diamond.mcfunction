#Replace the item to keep Motion
    kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:wheat"}},limit=1,sort=nearest,distance=..1]
    kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:wheat"}},limit=1,sort=nearest,distance=..1]
    execute if entity @s[tag=SF_SeedDone] run summon item ~ ~ ~ {Item:{id:"minecraft:diamond",Count:54b}}
    execute unless entity @s[tag=SF_SeedDone] run summon item ~ ~ ~ {Item:{id:"minecraft:cobblestone",Count:64b,tag:{SF_Give:1b}}}
    data modify entity @e[type=minecraft:item,nbt={Item:{tag:{SF_Give:1b}}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013201

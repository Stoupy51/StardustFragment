setblock ~ ~-1 ~ minecraft:air destroy
execute as @s[tag=SF_CobblestoneMinerLv1] run data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:cobblestone"}},limit=1] Item set from storage stardust:items 2013016
execute as @s[tag=SF_CobblestoneMinerLv2] run data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:cobblestone"}},limit=1] Item set from storage stardust:items 2013016
execute as @s[tag=SF_CobblestoneMinerLv2] run data modify entity @e[type=minecraft:item,nbt={Item:{tag:{SF_DoubleCompressedCobblestone:1b}}},limit=1] Item.Count set value 3b
execute as @s[tag=SF_CobblestoneMinerLv3] run data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:cobblestone"}},limit=1] Item set from storage stardust:items 2013017
execute as @s[tag=SF_CobblestoneMinerLv4] run data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:cobblestone"}},limit=1] Item set from storage stardust:items 2013017
execute as @s[tag=SF_CobblestoneMinerLv4] run data modify entity @e[type=minecraft:item,nbt={Item:{tag:{SF_TripleCompressedCobblestone:1b}}},limit=1] Item.Count set value 3b
execute as @s[tag=SF_CobblestoneMinerLv5] run data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:cobblestone"}},limit=1] Item set from storage stardust:items 2013018

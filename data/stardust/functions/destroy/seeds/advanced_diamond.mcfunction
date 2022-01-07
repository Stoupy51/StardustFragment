#Replace the item to keep Motion
	execute as @s[tag=SF_SeedDone] run data modify entity @e[type=item,tag=SF_Drop,limit=1] Item set value {id:"minecraft:diamond",Count:54b}
	execute unless entity @s[tag=SF_SeedDone] run data modify entity @e[type=item,tag=SF_Drop,limit=1] Item set from storage stardust:items all.2013201

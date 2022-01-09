#Replace the item to keep Motion
	execute if entity @s[tag=StardustFragment_SeedDone] run data modify entity @e[type=item,tag=StardustFragment_Drop,limit=1] Item set from storage stardust:items all.2013009
	execute unless entity @s[tag=StardustFragment_SeedDone] run data modify entity @e[type=item,tag=StardustFragment_Drop,limit=1] Item set from storage stardust:items all.2013206

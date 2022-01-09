#Replace the item to keep Motion
	execute if entity @s[tag=StardustFragment_SeedDone] as @e[type=item,tag=StardustFragment_Drop,limit=1] run function stardust:destroy/seeds/advanced_diamond_2
	execute unless entity @s[tag=StardustFragment_SeedDone] run data modify entity @e[type=item,tag=StardustFragment_Drop,limit=1] Item set from storage stardust:items all.2013201

#Replace the item to keep Motion
	execute if entity @s[tag=StardustFragment_SeedDone] run data modify entity @e[type=item,tag=StardustFragment_Drop,limit=1] Item set from storage stardust:items all.2013000
	data modify entity @e[type=item,nbt={Item:{tag:{StardustFragment_StardustFragment:1b}}},limit=1,sort=nearest,distance=..1,tag=StardustFragment_Drop] Item.Count set value 16b
	execute unless entity @s[tag=StardustFragment_SeedDone] run data modify entity @e[type=item,tag=StardustFragment_Drop,limit=1] Item set from storage stardust:items all.2013202

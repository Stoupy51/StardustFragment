
#Replace the item to keep Motion
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:nether_quartz_ore"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013026
	
	execute store result score #count stardust.data run data get entity @e[type=item,nbt={Item:{id:"minecraft:quartz"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item.Count
	execute store result score #temp stardust.data run data get entity @s UUID[1]
	scoreboard players operation #temp stardust.data %= #4 simplenergy.data
	scoreboard players add #temp stardust.data 1
	scoreboard players operation #count stardust.data *= #temp stardust.data
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:quartz"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013001
	execute store result entity @e[type=item,nbt={Item:{tag:{stardust:{stardust_ingot:1b}}}},limit=1,sort=nearest,distance=..1] Item.Count byte 1 run scoreboard players get #count stardust.data

kill @s

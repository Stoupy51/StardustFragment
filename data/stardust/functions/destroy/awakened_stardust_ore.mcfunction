
#Replace the item to keep Motion
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:deepslate_redstone_ore"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:main all.2013024
	
	execute store result score #count stardust.data run data get entity @e[type=item,nbt={Item:{id:"minecraft:redstone"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item.Count 3.14
	execute store result score #temp stardust.data run data get entity @s UUID[1]
	scoreboard players operation #temp stardust.data %= #4 simplenergy.data
	scoreboard players add #temp stardust.data 1
	scoreboard players operation #count stardust.data *= #temp stardust.data
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:redstone"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:main all.2013004
	execute store result entity @e[type=item,nbt={Item:{tag:{stardust:{awakened_stardust:1b}}}},limit=1,sort=nearest,distance=..1] Item.Count byte 1 run scoreboard players get #count stardust.data
kill @s

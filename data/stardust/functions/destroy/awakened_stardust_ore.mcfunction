#Replace the item to keep Motion
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:deepslate_redstone_ore"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013024
	
	execute store result score Count SF_Data run data get entity @e[type=item,nbt={Item:{id:"minecraft:redstone"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item.Count 3.14
	execute store result score Temp SF_Data run data get entity @s UUID[1]
	scoreboard players operation Temp SF_Data %= 4 SE_Data
	scoreboard players add Temp SF_Data 1
	scoreboard players operation Count SF_Data *= Temp SF_Data
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:redstone"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013004
	execute store result entity @e[type=item,nbt={Item:{tag:{SF_AwakenedStardust:1b}}},limit=1,sort=nearest,distance=..1] Item.Count byte 1 run scoreboard players get Count SF_Data
kill @s

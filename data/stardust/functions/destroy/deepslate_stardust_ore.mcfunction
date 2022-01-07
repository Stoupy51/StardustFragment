#Replace the item to keep Motion
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:deepslate_diamond_ore"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013025
	
	execute store result score Count StardustFragment_Data run data get entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item.Count
	execute store result score Temp StardustFragment_Data run data get entity @s UUID[1]
	scoreboard players operation Temp StardustFragment_Data %= 4 SimplEnergy_Data
	scoreboard players add Temp StardustFragment_Data 1
	scoreboard players operation Count StardustFragment_Data *= Temp StardustFragment_Data
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013000
	execute store result entity @e[type=item,nbt={Item:{tag:{StardustFragment_StardustFragment:1b}}},limit=1,sort=nearest,distance=..1] Item.Count byte 1 run scoreboard players get Count StardustFragment_Data

kill @s

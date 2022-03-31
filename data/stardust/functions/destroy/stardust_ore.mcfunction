
#Replace the item to keep Motion
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:deepslate_diamond_ore"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013023
	
	execute store result score Count stardust.data run data get entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item.Count
	execute store result score temp stardust.data run data get entity @s UUID[1]
	scoreboard players operation temp stardust.data %= #4 simplenergy.data
	scoreboard players add temp stardust.data 1
	scoreboard players operation Count stardust.data *= temp stardust.data
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013000
	execute store result entity @e[type=item,nbt={Item:{tag:{stardust:{stardust_fragment:1b}}}},limit=1,sort=nearest,distance=..1] Item.Count byte 1 run scoreboard players get Count stardust.data

kill @s

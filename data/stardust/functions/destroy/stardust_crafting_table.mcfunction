#Replace the item
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013399

#Kill undesired items
	scoreboard players operation CustomModelData SF_Data = @s SF_Data
	kill @e[type=item,nbt={Item:{tag:{SE_CustomTextureItem:1s}}},sort=nearest,distance=..1]
	execute as @e[type=item,distance=..1] run function stardust:craft/destroy

scoreboard players reset CustomModelData2 SF_Data
scoreboard players reset CustomModelData SF_Data
kill @s

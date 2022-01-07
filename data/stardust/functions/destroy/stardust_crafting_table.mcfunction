#Replace the item
	data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013399

#Kill undesired items
	scoreboard players operation CustomModelData StardustFragment_Data = @s StardustFragment_Data
	kill @e[type=item,nbt={Item:{tag:{SimplEnergy_CustomTextureItem:1b}}},sort=nearest,distance=..1]
	execute as @e[type=item,distance=..1] run function stardust:craft/destroy

scoreboard players reset CustomModelData2 StardustFragment_Data
scoreboard players reset CustomModelData StardustFragment_Data
kill @s

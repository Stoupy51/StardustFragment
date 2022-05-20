
execute if score @s energy.storage < @s energy.max_storage run function stardust:work/furnace_generator/advanced
#Update gui depends on BurnTime
	data modify block ~ ~ ~ Items insert -1 value {Slot:0b,id:"minecraft:cobblestone",Count:1b,tag:{CustomModelData:2013100,simplenergy:{texture_item:1b},display:{Name:'""'}}}
	execute unless data block ~ ~ ~ {BurnTime:0s} run data modify block ~ ~ ~ Items[0].tag.CustomModelData set value 2013101

	execute if data block ~ ~ ~ {BurnTime:0s} run data modify entity @s Item.tag.CustomModelData set value 2013325
	execute unless data block ~ ~ ~ {BurnTime:0s} run data modify entity @s Item.tag.CustomModelData set value 2013326

#Small Fix by the way
	data modify block ~ ~ ~ CookTimeTotal set value -200s
	data modify block ~ ~ ~ CookTime set value 0s

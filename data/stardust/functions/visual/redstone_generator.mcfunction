
execute if score @s energy.storage < @s energy.max_storage run function stardust:work/redstone_generator/all
#Update gui depends on BurnTime
	data modify block ~ ~ ~ Items insert -1 value {Slot:1b,id:"minecraft:cobblestone",Count:1b,tag:{CustomModelData:2013104,simplenergy:{texture_item:1b},display:{Name:'[{"text":""}]'}}}
	execute unless data block ~ ~ ~ {BurnTime:0s} run data modify block ~ ~ ~ Items[1].tag.CustomModelData set value 2013105

	execute if data block ~ ~ ~ {BurnTime:0s} run data modify entity @s Item.tag.CustomModelData set value 2013320
	execute unless data block ~ ~ ~ {BurnTime:0s} run data modify entity @s Item.tag.CustomModelData set value 2013321

#Small Fix by the way
	data modify block ~ ~ ~ CookTimeTotal set value -200s
	data modify block ~ ~ ~ CookTime set value 0s

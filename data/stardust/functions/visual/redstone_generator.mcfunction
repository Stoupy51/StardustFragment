
execute if score @s energy.storage < @s energy.max_storage run function stardust:work/redstone_generator/all
#Update gui depends on BurnTime
	scoreboard players set #success simplenergy.data 0
	execute store success score #success simplenergy.data if data block ~ ~ ~ {BurnTime:0s}
	execute if score #success simplenergy.data matches 1 run item replace block ~ ~ ~ container.1 with cobblestone{CustomModelData:2013104,simplenergy:{texture_item:1b},display:{Name:'""'}}
	execute if score #success simplenergy.data matches 0 run item replace block ~ ~ ~ container.1 with cobblestone{CustomModelData:2013105,simplenergy:{texture_item:1b},display:{Name:'""'}}
	execute if score #success simplenergy.data matches 1 run data modify entity @s item.tag.CustomModelData set value 2013318
	execute if score #success simplenergy.data matches 0 run data modify entity @s item.tag.CustomModelData set value 2013319

#Small Fix by the way
	data modify block ~ ~ ~ CookTimeTotal set value -200s
	data modify block ~ ~ ~ CookTime set value 0s

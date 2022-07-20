
execute if score @s energy.storage < @s energy.max_storage run function stardust:work/nether_star_generator/all
#Update gui depends on BurnTime
	scoreboard players set #success simplenergy.data 0
	execute store success score #success simplenergy.data if data block ~ ~ ~ {BurnTime:0s}
	execute if score #success simplenergy.data matches 1 run item replace block ~ ~ ~ container.1 with cobblestone{CustomModelData:2013102,simplenergy:{texture_item:1b},display:{Name:'""'}}
	execute if score #success simplenergy.data matches 0 run item replace block ~ ~ ~ container.1 with cobblestone{CustomModelData:2013103,simplenergy:{texture_item:1b},display:{Name:'""'}}
	execute if score #success simplenergy.data matches 1 run data modify entity @s Item.tag.CustomModelData set value 2013320
	execute if score #success simplenergy.data matches 0 run data modify entity @s Item.tag.CustomModelData set value 2013321

#Small Fix by the way
	data modify block ~ ~ ~ CookTimeTotal set value -200s
	data modify block ~ ~ ~ CookTime set value 0s

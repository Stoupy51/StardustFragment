execute unless score @s EF_kJ matches 30000.. run function stardust:work/nether_star_generator/all
#Update gui depends on BurnTime
	data modify block ~ ~ ~ Items insert -1 value {Slot:1b,id:"minecraft:cobblestone",Count:1b,tag:{CustomModelData:2013102,CustomItem:1s,SE_CustomTextureItem:1s,display:{Name:'[{"text":""}]'}}}
	execute unless block ~ ~ ~ minecraft:furnace{BurnTime:0s} run data modify block ~ ~ ~ Items[1] set value {Slot:1b,id:"minecraft:cobblestone",Count:1b,tag:{CustomModelData:2013103,CustomItem:1s,SE_CustomTextureItem:1s,display:{Name:'[{"text":""}]'}}}

	execute if block ~ ~ ~ minecraft:furnace{BurnTime:0s} run data modify entity @s Item.tag.CustomModelData set value 2013235
	execute unless block ~ ~ ~ minecraft:furnace{BurnTime:0s} run data modify entity @s Item.tag.CustomModelData set value 2013236

#Small Fix by the way
	data modify block ~ ~ ~ CookTimeTotal set value -200s
	data modify block ~ ~ ~ CookTime set value 0s

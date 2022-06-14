
#Mining the block at the current position
	scoreboard players set #valid stardust.data 0
	execute store success score #valid stardust.data if entity @s[tag=stardust.fortune_module] run loot spawn ~ ~ ~ mine ~ ~ ~ minecraft:netherite_pickaxe{Enchantments:[{id:"minecraft:fortune",lvl:3}]}
	execute if score #valid stardust.data matches 0 store success score #valid stardust.data if entity @s[tag=stardust.silk_touch_module] run loot spawn ~ ~ ~ mine ~ ~ ~ minecraft:netherite_pickaxe{Enchantments:[{id:"minecraft:silk_touch",lvl:1}]}
	execute if score #valid stardust.data matches 0 run setblock ~ ~ ~ air destroy
	execute if score #valid stardust.data matches 1 run clone ~ ~ ~ ~ ~ ~ -29999999 1 2013
	execute if score #valid stardust.data matches 1 run setblock ~ ~ ~ air


#Destroy some customs blocks
	function #stardust:signals/quarry_mined

#Items pickup
	tag @s add stardust.quarry_stock
	execute as @e[type=item,dx=0,dy=0,dz=0,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.ignore] at @e[tag=stardust.quarry_stock,limit=1] run function stardust:quarry/working/store_item
	tag @s remove stardust.quarry_stock

#Others
	kill @e[type=experience_orb,dx=0,dy=0,dz=0]
	scoreboard players remove #quarry_count stardust.data 49
	scoreboard players add #quarry_temp stardust.data 1

#Destroy the block in a special way if the quarry use a module
	execute if score #valid stardust.data matches 1 run clone -29999999 1 2013 -29999999 1 2013 ~ ~ ~
	execute if score #valid stardust.data matches 1 run setblock ~ ~ ~ air destroy
	execute if score #valid stardust.data matches 1 run kill @e[type=item,dx=0,dy=0,dz=0,tag=]

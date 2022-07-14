
#Destroy mechanization custom blocks
	execute as @e[tag=mechanization,dx=0,dy=0,dz=0,limit=1] at @s run function #mechanization:wrench_break

#Mining the block at the current position
	execute if score #module stardust.data matches 1 run loot spawn ~ ~ ~ mine ~ ~ ~ minecraft:netherite_pickaxe{Enchantments:[{id:"minecraft:fortune",lvl:3}]}
	execute if score #module stardust.data matches 2 run loot spawn ~ ~ ~ mine ~ ~ ~ minecraft:netherite_pickaxe{Enchantments:[{id:"minecraft:silk_touch",lvl:1}]}
	execute if score #module stardust.data matches 0 run setblock ~ ~ ~ air destroy
	execute unless score #module stardust.data matches 0 run clone ~ ~ ~ ~ ~ ~ -30000000 15 1610
	execute unless score #module stardust.data matches 0 run setblock ~ ~ ~ air


#Destroy some customs blocks
	function #stardust:signals/quarry_mined

#Items pickup
	execute as @e[type=item,dx=0,dy=0,dz=0,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.ignore] at @e[tag=stardust.quarry_stock,limit=1] run function stardust:quarry/working/store_item

#Others
	kill @e[type=experience_orb,dx=0,dy=0,dz=0]
	scoreboard players remove #quarry_count stardust.data 49
	scoreboard players add #quarry_temp stardust.data 1

#Destroy the block in a special way if the quarry use a module
	execute unless score #module stardust.data matches 0 run clone -30000000 15 1610 -30000000 15 1610 ~ ~ ~
	execute unless score #module stardust.data matches 0 run setblock ~ ~ ~ air destroy
	execute unless score #module stardust.data matches 0 run kill @e[type=item,dx=0,dy=0,dz=0,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.ignore]

kill @s

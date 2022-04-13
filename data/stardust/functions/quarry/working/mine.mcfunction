
#Mining the block at the current position
	scoreboard players set #valid stardust.data 0
	execute store success score #valid stardust.data if entity @s[tag=stardust.fortune_module] run loot spawn ~ ~ ~ mine ~ ~ ~ minecraft:netherite_pickaxe{Enchantments:[{id:"minecraft:fortune",lvl:3}]}
	execute if score #valid stardust.data matches 0 store success score #valid stardust.data if entity @s[tag=stardust.silk_touch_module] run loot spawn ~ ~ ~ mine ~ ~ ~ minecraft:netherite_pickaxe{Enchantments:[{id:"minecraft:silk_touch",lvl:1}]}
	execute if score #valid stardust.data matches 0 run setblock ~ ~ ~ minecraft:air destroy
	execute if score #valid stardust.data matches 1 run clone ~ ~ ~ ~ ~ ~ -29999999 1 2013
	execute if score #valid stardust.data matches 1 run setblock ~ ~ ~ minecraft:air


#Destroy some customs blocks
	execute if entity @e[type=glow_item_frame,tag=lthc.destroyable,distance=..1,limit=1] run function lthc.svext:custom_blocks/run
	execute if entity @e[type=glow_item_frame,tag=lthc.mage.destroyable,distance=..1,limit=1] run function lthc.mage:block_object_life/check
	execute if entity @e[type=#energy:valid_block_entities,tag=stardust.destroyer,distance=..1,limit=1] run function stardust:destroy/all
	execute if entity @e[type=#energy:valid_block_entities,tag=simplenergy.destroyer,distance=..1,limit=1] run function simplenergy:destroy/all

#Items pickup
	tag @s add stardust.quarry_stock
	execute as @e[type=item,distance=..1,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.ignore] at @e[type=glow_item_frame,tag=stardust.quarry_stock,limit=1] run function stardust:quarry/working/store_item
	tag @s remove stardust.quarry_stock

#Others
	kill @e[type=experience_orb,distance=..1]
	scoreboard players remove #count stardust.data 49
	scoreboard players add #temp stardust.data 1

#Destroy the block in a special way if the quarry use a module
	execute if score #valid stardust.data matches 1 run clone -29999999 1 2013 -29999999 1 2013 ~ ~ ~
	execute if score #valid stardust.data matches 1 run setblock ~ ~ ~ minecraft:air destroy
	execute if score #valid stardust.data matches 1 run kill @e[type=item,distance=..1.2,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.ignore,tag=!stardust.mined_by_quarry]

tag @s add stardust.quarryMinerDone

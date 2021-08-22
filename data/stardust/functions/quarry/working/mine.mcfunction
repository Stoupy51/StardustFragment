execute if entity @s[tag=SF_QuarryFortune] run loot spawn ~ ~ ~ mine ~ ~ ~ minecraft:netherite_pickaxe{Enchantments:[{id:"minecraft:fortune",lvl:3}]}
execute if entity @s[tag=SF_QuarrySilkTouch] run loot spawn ~ ~ ~ mine ~ ~ ~ minecraft:netherite_pickaxe{Enchantments:[{id:"minecraft:fortune",lvl:3}]}
execute if entity @s[tag=!SF_QuarryFortune,tag=!SF_QuarrySilkTouch] run setblock ~ ~ ~ minecraft:air destroy
setblock ~ ~ ~ minecraft:air
execute if entity @e[type=minecraft:glow_item_frame,tag=SF_Destroyer,distance=..1,limit=1] run function stardust:destroy/all
execute if entity @e[type=minecraft:glow_item_frame,tag=SE_Destroyer,distance=..1,limit=1] run function simplenergy:destroy/all
setblock -29999999 0 2013 shulker_box
execute as @e[type=minecraft:item,distance=..1] run function stardust:quarry/working/store_item
execute at @s run loot insert ~ ~ ~ mine -29999999 0 2013 minecraft:air{drop_contents:true}
kill @e[type=minecraft:experience_orb,distance=..1]

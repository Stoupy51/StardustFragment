execute as @s[tag=SF_FortuneModule] run loot spawn ~ ~ ~ mine ~ ~ ~ minecraft:netherite_pickaxe{Enchantments:[{id:"minecraft:fortune",lvl:3}]}
execute as @s[tag=SF_SilkTouchModule] run loot spawn ~ ~ ~ mine ~ ~ ~ minecraft:netherite_pickaxe{Enchantments:[{id:"minecraft:silk_touch",lvl:1}]}
execute as @s[tag=!SF_FortuneModule,tag=!SF_SilkTouchModule] run setblock ~ ~ ~ minecraft:air destroy
setblock ~ ~ ~ minecraft:air
execute if entity @e[type=glow_item_frame,tag=lthc.destroyable,distance=..1,limit=1] run function lthc.svext:custom_blocks/run
execute if entity @e[type=#energy:valid_block_entities,tag=SF_Destroyer,distance=..1,limit=1] run function stardust:destroy/all
execute if entity @e[type=#energy:valid_block_entities,tag=SE_Destroyer,distance=..1,limit=1] run function simplenergy:destroy/all
tag @s add SF_QuarryStock
execute as @e[type=item,distance=..1.2] run function stardust:quarry/working/store_item
tag @s remove SF_QuarryStock
kill @e[type=experience_orb,distance=..1]
scoreboard players remove Count SF_Data 49
scoreboard players add Temp SF_Data 1

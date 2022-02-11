execute if entity @s[tag=StardustFragment_FortuneModule] run loot spawn ~ ~ ~ mine ~ ~ ~ minecraft:netherite_pickaxe{Enchantments:[{id:"minecraft:fortune",lvl:3}]}
execute if entity @s[tag=StardustFragment_SilkTouchModule] run loot spawn ~ ~ ~ mine ~ ~ ~ minecraft:netherite_pickaxe{Enchantments:[{id:"minecraft:silk_touch",lvl:1}]}
execute if entity @s[tag=!StardustFragment_FortuneModule,tag=!StardustFragment_SilkTouchModule] run setblock ~ ~ ~ minecraft:air destroy
setblock ~ ~ ~ minecraft:air
execute if entity @e[type=glow_item_frame,tag=lthc.destroyable,distance=..1,limit=1] run function lthc.svext:custom_blocks/run
execute if entity @e[type=glow_item_frame,tag=lthc.mage.destroyable,distance=..1,limit=1] run function lthc.mage:block_object_life/check
execute if entity @e[type=#energy:valid_block_entities,tag=StardustFragment_Destroyer,distance=..1,limit=1] run function stardust:destroy/all
execute if entity @e[type=#energy:valid_block_entities,tag=SimplEnergy_Destroyer,distance=..1,limit=1] run function simplenergy:destroy/all
tag @s add StardustFragment_QuarryStock
execute as @e[type=item,distance=..1.2,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.ignore] run function stardust:quarry/working/store_item
tag @s remove StardustFragment_QuarryStock
kill @e[type=experience_orb,distance=..1]
scoreboard players remove Count StardustFragment_Data 49
scoreboard players add Temp StardustFragment_Data 1

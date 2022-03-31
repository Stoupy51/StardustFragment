execute if entity @s[tag=stardust.fortune_module] run loot spawn ~ ~ ~ mine ~ ~ ~ minecraft:netherite_pickaxe{Enchantments:[{id:"minecraft:fortune",lvl:3}]}
execute if entity @s[tag=stardust.silk_touch_module] run loot spawn ~ ~ ~ mine ~ ~ ~ minecraft:netherite_pickaxe{Enchantments:[{id:"minecraft:silk_touch",lvl:1}]}
execute if entity @s[tag=!stardust.fortune_module,tag=!stardust.silk_touch_module] run setblock ~ ~ ~ minecraft:air destroy
setblock ~ ~ ~ minecraft:air
execute if entity @e[type=glow_item_frame,tag=lthc.destroyable,distance=..1,limit=1] run function lthc.svext:custom_blocks/run
execute if entity @e[type=glow_item_frame,tag=lthc.mage.destroyable,distance=..1,limit=1] run function lthc.mage:block_object_life/check
execute if entity @e[type=#energy:valid_block_entities,tag=stardust.destroyer,distance=..1,limit=1] run function stardust:destroy/all
execute if entity @e[type=#energy:valid_block_entities,tag=simplenergy.destroyer,distance=..1,limit=1] run function simplenergy:destroy/all
tag @s add stardust.quarryStock
execute as @e[type=item,distance=..1.2,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.ignore] run function stardust:quarry/working/store_item
tag @s remove stardust.quarryStock
kill @e[type=experience_orb,distance=..1]
scoreboard players remove Count stardust.data 49
scoreboard players add temp stardust.data 1

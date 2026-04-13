
#> stardust:quarry/working/mine_block
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:quarry/working/break_at_position
#

# If block is air, skip (remove one block to check), else continue and remove quarry_multiplier blocks to check
execute at @s if block ~ ~ ~ #minecraft:air run return run scoreboard players remove #blocks_to_break stardust.data 1
scoreboard players operation #blocks_to_break stardust.data -= #quarry_multiplier stardust.data

# Destroy mechanization custom blocks
execute at @s align xyz as @e[tag=mechanization,dx=0,dy=0,dz=0,limit=1] at @s run function #mechanization:wrench_break

# Check if block is a container with items or not
execute at @s store success score #is_container stardust.data if block ~ ~ ~ #itemio:container
execute if score #is_container stardust.data matches 0 if score #fortune_level stardust.data matches 0 if score #silk_touch_level stardust.data matches 0 run scoreboard players set #is_container stardust.data 1

# Mining the block at the current position
execute if score #is_container stardust.data matches 0 if score #fortune_level stardust.data matches 1 at @s run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe[enchantments={fortune:1}]
execute if score #is_container stardust.data matches 0 if score #fortune_level stardust.data matches 2 at @s run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe[enchantments={fortune:2}]
execute if score #is_container stardust.data matches 0 if score #fortune_level stardust.data matches 3 at @s run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe[enchantments={fortune:3}]
execute if score #is_container stardust.data matches 0 if score #fortune_level stardust.data matches 4 at @s run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe[enchantments={fortune:4}]
execute if score #is_container stardust.data matches 0 if score #fortune_level stardust.data matches 5.. at @s run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe[enchantments={fortune:5}]
execute if score #is_container stardust.data matches 0 if score #silk_touch_level stardust.data matches 1 at @s run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe[enchantments={silk_touch:1}]
execute if score #is_container stardust.data matches 0 at @s run clone ~ ~ ~ ~ ~ ~ -30000000 51 1610
execute if score #is_container stardust.data matches 0 at @s run setblock ~ ~ ~ minecraft:air
execute if score #is_container stardust.data matches 1 at @s run setblock ~ ~ ~ minecraft:air destroy

# Destroy some custom blocks
execute at @s align xyz run function #common_signals:calls/destroyed_block

# Pickup items
execute at @s run kill @e[type=experience_orb,distance=..2,tag=!smithed.entity,tag=!global.ignore]
execute at @s run tag @e[type=item,dx=0,dy=0,dz=0,tag=!smithed.entity,tag=!global.ignore] add stardust.quarry_item
execute as @e[tag=stardust.quarry_item] run function stardust:quarry/working/pickup_item

# Destroy the block in a special way if not container
execute if score #is_container stardust.data matches 0 at @s run clone -30000000 51 1610 -30000000 51 1610 ~ ~ ~
execute if score #is_container stardust.data matches 0 at @s run setblock ~ ~ ~ air destroy
execute if score #is_container stardust.data matches 0 at @s run kill @e[type=item,dx=0,dy=0,dz=0,tag=!smithed.entity,tag=!global.ignore]


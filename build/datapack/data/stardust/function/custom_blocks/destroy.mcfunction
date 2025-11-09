
#> stardust:custom_blocks/destroy
#
# @executed	as @e[type=#stardust:custom_blocks,tag=...,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:v3.5.0/second [ as @e[type=#stardust:custom_blocks,tag=...,predicate=!stardust:advanced_check_vanilla_blocks] & at @s ]
#			stardust:v3.5.0/tick_2 [ as @e[type=item_display,tag=...,predicate=!stardust:check_vanilla_blocks] & at @s ]
#			stardust:v3.5.0/second_5 [ as @e[type=item_display,tag=stardust.custom_block,predicate=!stardust:advanced_check_vanilla_blocks] & at @s ]
#			stardust:calls/common_signals/custom_block_destroy [ as @e[tag=stardust.custom_block,dx=0,dy=0,dz=0] & at @s ]
#			stardust:calls/mechanization/wrench_break
#

# Check for missing vanilla blocks
execute if score #total_vanilla_barrel stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_barrel] unless block ~ ~ ~ minecraft:barrel run return run function stardust:custom_blocks/_groups/minecraft_barrel
execute if score #total_vanilla_crimson_hyphae stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_crimson_hyphae] unless block ~ ~ ~ minecraft:crimson_hyphae run return run function stardust:custom_blocks/_groups/minecraft_crimson_hyphae
execute if score #total_vanilla_crying_obsidian stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_crying_obsidian] unless block ~ ~ ~ minecraft:crying_obsidian run return run function stardust:custom_blocks/_groups/minecraft_crying_obsidian
execute if score #total_vanilla_daylight_detector stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_daylight_detector] unless block ~ ~ ~ minecraft:daylight_detector run return run function stardust:custom_blocks/_groups/minecraft_daylight_detector
execute if score #total_vanilla_deepslate stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_deepslate] unless block ~ ~ ~ minecraft:deepslate run return run function stardust:custom_blocks/_groups/minecraft_deepslate
execute if score #total_vanilla_diamond_block stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_diamond_block] unless block ~ ~ ~ minecraft:diamond_block run return run function stardust:custom_blocks/_groups/minecraft_diamond_block
execute if score #total_vanilla_emerald_block stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_emerald_block] unless block ~ ~ ~ minecraft:emerald_block run return run function stardust:custom_blocks/_groups/minecraft_emerald_block
execute if score #total_vanilla_furnace stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_furnace] unless block ~ ~ ~ minecraft:furnace run return run function stardust:custom_blocks/_groups/minecraft_furnace
execute if score #total_vanilla_glass stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_glass] unless block ~ ~ ~ minecraft:glass run return run function stardust:custom_blocks/_groups/minecraft_glass
execute if score #total_vanilla_lapis_block stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_lapis_block] unless block ~ ~ ~ minecraft:lapis_block run return run function stardust:custom_blocks/_groups/minecraft_lapis_block
execute if score #total_vanilla_moss_carpet stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_moss_carpet] unless block ~ ~ ~ minecraft:moss_carpet run return run function stardust:custom_blocks/_groups/minecraft_moss_carpet
execute if score #total_vanilla_netherite_block stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_netherite_block] unless block ~ ~ ~ minecraft:netherite_block run return run function stardust:custom_blocks/_groups/minecraft_netherite_block
execute if score #total_vanilla_obsidian stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_obsidian] unless block ~ ~ ~ minecraft:obsidian run return run function stardust:custom_blocks/_groups/minecraft_obsidian
execute if score #total_vanilla_player_head stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_player_head] unless block ~ ~ ~ minecraft:player_head run return run function stardust:custom_blocks/_groups/minecraft_player_head
execute if score #total_vanilla_polished_deepslate stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_polished_deepslate] unless block ~ ~ ~ minecraft:polished_deepslate run return run function stardust:custom_blocks/_groups/minecraft_polished_deepslate
execute if score #total_vanilla_redstone_block stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_redstone_block] unless block ~ ~ ~ minecraft:redstone_block run return run function stardust:custom_blocks/_groups/minecraft_redstone_block
execute if score #total_vanilla_warped_hyphae stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_warped_hyphae] unless block ~ ~ ~ minecraft:warped_hyphae run return run function stardust:custom_blocks/_groups/minecraft_warped_hyphae
execute if score #total_vanilla_waxed_copper_block stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_waxed_copper_block] unless block ~ ~ ~ minecraft:waxed_copper_block run return run function stardust:custom_blocks/_groups/minecraft_waxed_copper_block


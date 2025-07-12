
#> stardust:custom_blocks/destroy
#
# @within	stardust:v3.5.0/tick_2
#			stardust:v3.5.0/second
#			stardust:v3.5.0/second_5
#			stardust:calls/common_signals/on_ore_destroyed
#

execute if score #total_vanilla_cobblestone stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_cobblestone] unless block ~ ~ ~ minecraft:cobblestone run function stardust:custom_blocks/_groups/minecraft_cobblestone
execute if score #total_vanilla_diamond_block stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_diamond_block] unless block ~ ~ ~ minecraft:diamond_block run function stardust:custom_blocks/_groups/minecraft_diamond_block
execute if score #total_vanilla_lapis_block stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_lapis_block] unless block ~ ~ ~ minecraft:lapis_block run function stardust:custom_blocks/_groups/minecraft_lapis_block
execute if score #total_vanilla_polished_deepslate stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_polished_deepslate] unless block ~ ~ ~ minecraft:polished_deepslate run function stardust:custom_blocks/_groups/minecraft_polished_deepslate
execute if score #total_vanilla_redstone_block stardust.data matches 1.. if entity @s[tag=stardust.vanilla.minecraft_redstone_block] unless block ~ ~ ~ minecraft:redstone_block run function stardust:custom_blocks/_groups/minecraft_redstone_block


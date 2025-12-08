
#> stardust:custom_blocks/destroy_growing_seeds
#
# @executed	at @s
#
# @within	stardust:v4.0.0/second_5 [ at @s ]
#

execute if score #total_diamond_seed stardust.data matches 1.. if entity @s[tag=stardust.diamond_seed] unless block ~ ~-1 ~ stone run return run function stardust:custom_blocks/no_block_below {item:"diamond_seed"}
execute if score #total_advanced_diamond_seed stardust.data matches 1.. if entity @s[tag=stardust.advanced_diamond_seed] unless block ~ ~-1 ~ stone run return run function stardust:custom_blocks/no_block_below {item:"advanced_diamond_seed"}
execute if score #total_stardust_seed stardust.data matches 1.. if entity @s[tag=stardust.stardust_seed] unless block ~ ~-1 ~ diamond_block run return run function stardust:custom_blocks/no_block_below {item:"stardust_seed"}
execute if score #total_advanced_stardust_seed stardust.data matches 1.. if entity @s[tag=stardust.advanced_stardust_seed] unless block ~ ~-1 ~ diamond_block run return run function stardust:custom_blocks/no_block_below {item:"advanced_stardust_seed"}
execute if score #total_elite_stardust_seed stardust.data matches 1.. if entity @s[tag=stardust.elite_stardust_seed] unless block ~ ~-1 ~ diamond_block run return run function stardust:custom_blocks/no_block_below {item:"elite_stardust_seed"}
execute if score #total_legendarium_seed stardust.data matches 1.. if entity @s[tag=stardust.legendarium_seed] unless block ~ ~-1 ~ emerald_block run return run function stardust:custom_blocks/no_block_below {item:"legendarium_seed"}
execute if score #total_solarium_seed stardust.data matches 1.. if entity @s[tag=stardust.solarium_seed] unless block ~ ~-1 ~ magma_block run return run function stardust:custom_blocks/no_block_below {item:"solarium_seed"}
execute if score #total_darkium_seed stardust.data matches 1.. if entity @s[tag=stardust.darkium_seed] unless block ~ ~-1 ~ obsidian run return run function stardust:custom_blocks/no_block_below {item:"darkium_seed"}


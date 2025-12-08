
#> stardust:custom_blocks/minute
#
# @executed	positioned ~-10 ~-10 ~-10 & as @e[tag=stardust.growing_seed,dx=20,dy=20,dz=20]
#
# @within	stardust:calls/stardust/growth_accelerator [ positioned ~-10 ~-10 ~-10 & as @e[tag=stardust.growing_seed,dx=20,dy=20,dz=20] ]
#			stardust:v4.0.0/minute [ at @s ]
#

execute if entity @s[tag=stardust.diamond_seed] run function stardust:custom_blocks/diamond_seed/minute
execute if entity @s[tag=stardust.advanced_diamond_seed] run function stardust:custom_blocks/advanced_diamond_seed/minute
execute if entity @s[tag=stardust.stardust_seed] run function stardust:custom_blocks/stardust_seed/minute
execute if entity @s[tag=stardust.advanced_stardust_seed] run function stardust:custom_blocks/advanced_stardust_seed/minute
execute if entity @s[tag=stardust.elite_stardust_seed] run function stardust:custom_blocks/elite_stardust_seed/minute
execute if entity @s[tag=stardust.legendarium_seed] run function stardust:custom_blocks/legendarium_seed/minute
execute if entity @s[tag=stardust.solarium_seed] run function stardust:custom_blocks/solarium_seed/minute
execute if entity @s[tag=stardust.darkium_seed] run function stardust:custom_blocks/darkium_seed/minute
execute if entity @s[tag=stardust.cobblestone_miner_lv1] run function stardust:custom_blocks/cobblestone_miner_lv1/minute
execute if entity @s[tag=stardust.cobblestone_miner_lv2] run function stardust:custom_blocks/cobblestone_miner_lv2/minute
execute if entity @s[tag=stardust.cobblestone_miner_lv3] run function stardust:custom_blocks/cobblestone_miner_lv3/minute
execute if entity @s[tag=stardust.cobblestone_miner_lv4] run function stardust:custom_blocks/cobblestone_miner_lv4/minute
execute if entity @s[tag=stardust.cobblestone_miner_lv5] run function stardust:custom_blocks/cobblestone_miner_lv5/minute
execute if entity @s[tag=stardust.cobblestone_miner_lv6] run function stardust:custom_blocks/cobblestone_miner_lv6/minute
execute if entity @s[tag=stardust.cobblestone_miner_lv7] run function stardust:custom_blocks/cobblestone_miner_lv7/minute
execute if entity @s[tag=stardust.cobblestone_miner_lv8] run function stardust:custom_blocks/cobblestone_miner_lv8/minute


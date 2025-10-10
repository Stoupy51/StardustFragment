
#> stardust:custom_blocks/minute
#
# @executed	at @s
#
# @within	stardust:v3.5.0/minute [ at @s ]
#

execute if entity @s[tag=stardust.diamond_seed] run function stardust:custom_blocks/diamond_seed/minute
execute if entity @s[tag=stardust.advanced_diamond_seed] run function stardust:custom_blocks/advanced_diamond_seed/minute
execute if entity @s[tag=stardust.stardust_seed] run function stardust:custom_blocks/stardust_seed/minute
execute if entity @s[tag=stardust.advanced_stardust_seed] run function stardust:custom_blocks/advanced_stardust_seed/minute
execute if entity @s[tag=stardust.elite_stardust_seed] run function stardust:custom_blocks/elite_stardust_seed/minute
execute if entity @s[tag=stardust.legendarium_seed] run function stardust:custom_blocks/legendarium_seed/minute
execute if entity @s[tag=stardust.solarium_seed] run function stardust:custom_blocks/solarium_seed/minute
execute if entity @s[tag=stardust.darkium_seed] run function stardust:custom_blocks/darkium_seed/minute


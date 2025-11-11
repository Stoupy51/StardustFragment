
#> stardust:custom_blocks/stardust_ore/place_main
#
# @within	stardust:custom_blocks/place
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~-0.2 ~-0.2 ~-0.2 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~-0.2 ~-0.2 ~0.0 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~-0.2 ~-0.2 ~0.2 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~-0.2 ~0.0 ~-0.2 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~-0.2 ~0.0 ~0.0 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~-0.2 ~0.0 ~0.2 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~-0.2 ~0.2 ~-0.2 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~-0.2 ~0.2 ~0.0 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~-0.2 ~0.2 ~0.2 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~0.0 ~-0.2 ~-0.2 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~0.0 ~-0.2 ~0.0 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~0.0 ~-0.2 ~0.2 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~0.0 ~0.0 ~-0.2 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~0.0 ~0.0 ~0.0 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~0.0 ~0.0 ~0.2 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~0.0 ~0.2 ~-0.2 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~0.0 ~0.2 ~0.0 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~0.0 ~0.2 ~0.2 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~0.2 ~-0.2 ~-0.2 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~0.2 ~-0.2 ~0.0 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~0.2 ~-0.2 ~0.2 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~0.2 ~0.0 ~-0.2 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~0.2 ~0.0 ~0.0 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~0.2 ~0.0 ~0.2 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~0.2 ~0.2 ~-0.2 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~0.2 ~0.2 ~0.0 ]
#			stardust:calls/smart_ore_generation/veins/stardust_ore [ at @s & positioned ~0.2 ~0.2 ~0.2 ]
#

tag @s add stardust.placer
setblock ~ ~ ~ air strict
setblock ~ ~ ~ minecraft:polished_deepslate
execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function stardust:custom_blocks/stardust_ore/place_secondary
tag @s remove stardust.placer

# Increment count scores
scoreboard players add #total_custom_blocks stardust.data 1
scoreboard players add #total_vanilla_polished_deepslate stardust.data 1
scoreboard players add #total_stardust_ore stardust.data 1


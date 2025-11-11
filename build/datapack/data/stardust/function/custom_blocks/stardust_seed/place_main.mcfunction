
#> stardust:custom_blocks/stardust_seed/place_main
#
# @executed	as @e[type=item_frame,tag=...] & at @s
#
# @within	stardust:custom_blocks/stardust_seed/place_check
#

tag @s add stardust.placer
setblock ~ ~ ~ air strict
setblock ~ ~ ~ minecraft:moss_carpet
execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function stardust:custom_blocks/stardust_seed/place_secondary
tag @s remove stardust.placer

# Increment count scores
scoreboard players add #total_custom_blocks stardust.data 1
scoreboard players add #total_vanilla_moss_carpet stardust.data 1
scoreboard players add #total_stardust_seed stardust.data 1
scoreboard players add #total_growing_seeds stardust.data 1
kill @s[type=item_frame]


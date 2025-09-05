
#> stardust:calls/common_signals/on_ore_destroyed
#
# @executed	at @s & align xyz
#
# @within	stardust:calls/common_signals/new_item [ at @s & align xyz ]
#

# Get in a score the item count and if it is a silk touch
scoreboard players set #item_count stardust.data 0
scoreboard players set #is_silk_touch stardust.data 0
execute store result score #item_count stardust.data run data get entity @s Item.count
execute store success score #is_silk_touch stardust.data if data entity @s Item.components."minecraft:custom_data".common_signals.silk_touch

# Try to destroy the block
execute as @e[tag=stardust.custom_block,dx=0,dy=0,dz=0] at @s run function stardust:custom_blocks/destroy


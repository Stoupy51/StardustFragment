
#> stardust:custom_blocks/legendarium_block/destroy
#
# @within	stardust:custom_blocks/_groups/minecraft_diamond_block
#

# Replace the item with the custom one
execute as @n[type=item,nbt={Item:{id:"minecraft:diamond_block"}},distance=..1] run function stardust:custom_blocks/legendarium_block/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks stardust.data 1
scoreboard players remove #total_vanilla_diamond_block stardust.data 1
scoreboard players remove #total_legendarium_block stardust.data 1

# Kill the custom block entity
kill @s


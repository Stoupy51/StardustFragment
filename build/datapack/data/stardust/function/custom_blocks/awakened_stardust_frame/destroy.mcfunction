
#> stardust:custom_blocks/awakened_stardust_frame/destroy
#
# @within	stardust:custom_blocks/_groups/minecraft_redstone_block
#

# Replace the item with the custom one
execute as @n[type=item,nbt={Item:{id:"minecraft:redstone_block"}},distance=..1] run function stardust:custom_blocks/awakened_stardust_frame/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks stardust.data 1
scoreboard players remove #total_vanilla_redstone_block stardust.data 1
scoreboard players remove #total_awakened_stardust_frame stardust.data 1

# Kill the custom block entity
kill @s


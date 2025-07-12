
#> stardust:custom_blocks/stardust_block/destroy
#
# @within	stardust:custom_blocks/_groups/minecraft_lapis_block
#

# Replace the item with the custom one
execute as @n[type=item,nbt={Item:{id:"minecraft:lapis_block"}},distance=..1] run function stardust:custom_blocks/stardust_block/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks stardust.data 1
scoreboard players remove #total_vanilla_lapis_block stardust.data 1
scoreboard players remove #total_stardust_block stardust.data 1

# Kill the custom block entity
kill @s


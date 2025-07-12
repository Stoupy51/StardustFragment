
#> stardust:custom_blocks/compressed_cobblestone/destroy
#
# @within	stardust:custom_blocks/_groups/minecraft_cobblestone
#

# Replace the item with the custom one
execute as @n[type=item,nbt={Item:{id:"minecraft:cobblestone"}},distance=..1] run function stardust:custom_blocks/compressed_cobblestone/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks stardust.data 1
scoreboard players remove #total_vanilla_cobblestone stardust.data 1
scoreboard players remove #total_compressed_cobblestone stardust.data 1

# Kill the custom block entity
kill @s


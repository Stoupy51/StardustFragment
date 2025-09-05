
#> stardust:custom_blocks/stardust_battery/destroy
#
# @executed	as @e[type=item_display,tag=...,predicate=!stardust:check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/_groups/minecraft_warped_hyphae
#

# Keep energy when destroying the block
scoreboard players operation #storage stardust.data = @s energy.storage

# Datapack Energy
function energy:v1/api/break_machine

# Replace the item with the custom one
execute as @n[type=item,nbt={Item:{id:"minecraft:warped_hyphae"}},distance=..1] run function stardust:custom_blocks/stardust_battery/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks stardust.data 1
scoreboard players remove #total_vanilla_warped_hyphae stardust.data 1
scoreboard players remove #total_stardust_battery stardust.data 1

# Kill the custom block entity
kill @s


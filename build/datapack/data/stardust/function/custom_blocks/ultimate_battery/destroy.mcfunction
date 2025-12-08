
#> stardust:custom_blocks/ultimate_battery/destroy
#
# @executed	as @e[type=item_display,tag=stardust.custom_block,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/_groups/minecraft_crying_obsidian
#

# Keep energy when destroying the block
scoreboard players operation #storage stardust.data = @s energy.storage

# Datapack Energy
function energy:v1/api/break_machine

# Replace the item with the custom one
execute as @n[type=item,nbt={Item:{id:"minecraft:crying_obsidian"}},distance=..1] run function stardust:custom_blocks/ultimate_battery/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks stardust.data 1
scoreboard players remove #total_vanilla_crying_obsidian stardust.data 1
scoreboard players remove #total_ultimate_battery stardust.data 1

# Kill the custom block entity
kill @s


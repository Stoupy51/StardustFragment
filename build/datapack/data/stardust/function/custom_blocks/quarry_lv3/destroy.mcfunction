
#> stardust:custom_blocks/quarry_lv3/destroy
#
# @executed	as @e[type=item_display,tag=stardust.custom_block,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/_groups/minecraft_barrel
#

# ItemIO compatibility
function #itemio:calls/container/destroy

# If has force load module, stop force loading
function stardust:quarry/stop_force_load

# Datapack Energy
function energy:v1/api/break_machine

# Replace the item with the custom one
execute as @n[type=item,nbt={Item:{id:"minecraft:barrel"}},distance=..1] run function stardust:custom_blocks/quarry_lv3/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks stardust.data 1
scoreboard players remove #total_vanilla_barrel stardust.data 1
scoreboard players remove #total_quarry_lv3 stardust.data 1

# Kill the custom block entity
kill @s

# Decrease the number of entities with second tag
scoreboard players remove #second_entities stardust.data 1


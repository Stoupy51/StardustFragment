
#> stardust:custom_blocks/life_crystal_block/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:glass"}},distance=..1]
#
# @within	stardust:custom_blocks/life_crystal_block/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:glass"}},distance=..1] ]
#

# If silk touch applied
execute if score #is_silk_touch stardust.data matches 1 run data modify entity @s Item.id set from storage stardust:items all.life_crystal_block.id
execute if score #is_silk_touch stardust.data matches 1 run data modify entity @s Item.components set from storage stardust:items all.life_crystal_block.components

# Else, no silk touch
execute if score #is_silk_touch stardust.data matches 0 run data modify entity @s Item.id set from storage stardust:items all.life_crystal.id
execute if score #is_silk_touch stardust.data matches 0 run data modify entity @s Item.components set from storage stardust:items all.life_crystal.components

# Get item count in every case
execute store result entity @s Item.count byte 1 run scoreboard players get #item_count stardust.data


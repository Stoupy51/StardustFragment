
#> stardust:custom_blocks/ender_stardust_ore/replace_item
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:polished_deepslate"}},distance=..1]
#
# @within	stardust:custom_blocks/ender_stardust_ore/destroy [ as @n[type=item,nbt={Item:{id:"minecraft:polished_deepslate"}},distance=..1] ]
#

# If silk touch applied
execute if score #is_silk_touch stardust.data matches 1 run data modify entity @s Item.id set from storage stardust:items all.ender_stardust_ore.id
execute if score #is_silk_touch stardust.data matches 1 run data modify entity @s Item.components set from storage stardust:items all.ender_stardust_ore.components

# Else, no silk touch
execute if score #is_silk_touch stardust.data matches 0 run data modify entity @s Item.id set from storage stardust:items all.stardust_essence.id
execute if score #is_silk_touch stardust.data matches 0 run data modify entity @s Item.components set from storage stardust:items all.stardust_essence.components
execute if score #is_silk_touch stardust.data matches 0 run scoreboard players set #divider stardust.data 100
execute if score #is_silk_touch stardust.data matches 0 store result score #multiplier stardust.data run random value 100..200
execute if score #is_silk_touch stardust.data matches 0 run scoreboard players operation #item_count stardust.data *= #multiplier stardust.data
execute if score #is_silk_touch stardust.data matches 0 run scoreboard players operation #item_count stardust.data /= #divider stardust.data

# Get item count in every case
execute store result entity @s Item.count byte 1 run scoreboard players get #item_count stardust.data



#> stardust:custom_blocks/deepslate_stardust_ore/replace_item
#
# @within	stardust:custom_blocks/deepslate_stardust_ore/destroy
#

# If silk touch applied
execute if score #is_silk_touch stardust.data matches 1 run data modify entity @s Item.id set from storage stardust:items all.deepslate_stardust_ore.id
execute if score #is_silk_touch stardust.data matches 1 run data modify entity @s Item.components set from storage stardust:items all.deepslate_stardust_ore.components

# Else, no silk touch
execute if score #is_silk_touch stardust.data matches 0 run data modify entity @s Item.id set from storage stardust:items all.stardust_fragment.id
execute if score #is_silk_touch stardust.data matches 0 run data modify entity @s Item.components set from storage stardust:items all.stardust_fragment.components

# Get item count in every case
execute store result entity @s Item.count byte 1 run scoreboard players get #item_count stardust.data


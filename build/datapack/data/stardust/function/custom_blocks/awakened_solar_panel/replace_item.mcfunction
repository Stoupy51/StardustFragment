
#> stardust:custom_blocks/awakened_solar_panel/replace_item
#
# @within	stardust:custom_blocks/awakened_solar_panel/destroy
#

data modify entity @s Item.components set from storage stardust:items all.awakened_solar_panel.components
data modify entity @s Item.id set from storage stardust:items all.awakened_solar_panel.id


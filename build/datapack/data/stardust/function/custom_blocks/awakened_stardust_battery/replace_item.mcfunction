
#> stardust:custom_blocks/awakened_stardust_battery/replace_item
#
# @within	stardust:custom_blocks/awakened_stardust_battery/destroy
#

data modify entity @s Item.components set from storage stardust:items all.awakened_stardust_battery.components
data modify entity @s Item.id set from storage stardust:items all.awakened_stardust_battery.id



#> stardust:custom_blocks/stardust_frame/replace_item
#
# @within	stardust:custom_blocks/stardust_frame/destroy
#

data modify entity @s Item.components set from storage stardust:items all.stardust_frame.components
data modify entity @s Item.id set from storage stardust:items all.stardust_frame.id


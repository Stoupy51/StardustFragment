
#> stardust:custom_blocks/stardust_core/replace_item
#
# @within	stardust:custom_blocks/stardust_core/destroy
#

data modify entity @s Item.components set from storage stardust:items all.stardust_core.components
data modify entity @s Item.id set from storage stardust:items all.stardust_core.id


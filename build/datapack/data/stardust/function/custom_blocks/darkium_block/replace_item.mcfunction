
#> stardust:custom_blocks/darkium_block/replace_item
#
# @within	stardust:custom_blocks/darkium_block/destroy
#

data modify entity @s Item.components set from storage stardust:items all.darkium_block.components
data modify entity @s Item.id set from storage stardust:items all.darkium_block.id


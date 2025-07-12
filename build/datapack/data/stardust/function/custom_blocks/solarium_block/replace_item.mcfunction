
#> stardust:custom_blocks/solarium_block/replace_item
#
# @within	stardust:custom_blocks/solarium_block/destroy
#

data modify entity @s Item.components set from storage stardust:items all.solarium_block.components
data modify entity @s Item.id set from storage stardust:items all.solarium_block.id



#> stardust:custom_blocks/compressed_cobblestone/replace_item
#
# @within	stardust:custom_blocks/compressed_cobblestone/destroy
#

data modify entity @s Item.components set from storage stardust:items all.compressed_cobblestone.components
data modify entity @s Item.id set from storage stardust:items all.compressed_cobblestone.id


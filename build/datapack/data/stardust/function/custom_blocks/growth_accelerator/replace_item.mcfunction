
#> stardust:custom_blocks/growth_accelerator/replace_item
#
# @within	stardust:custom_blocks/growth_accelerator/destroy
#

data modify entity @s Item.components set from storage stardust:items all.growth_accelerator.components
data modify entity @s Item.id set from storage stardust:items all.growth_accelerator.id


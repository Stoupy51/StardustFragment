
#> stardust:mobs/item_display/stardust_evoker
#
# @within			stardust:mobs/stardust_evoker
# @executed			as the item display entity of the Stardust Evoker
#
# @description		Setup the item display for the Stardust Evoker
#

# Remove tag new
execute on vehicle run tag @s remove stardust.new

# Setup item display
item replace entity @s container.0 with golden_hoe{CustomModelData:2013010}
data modify entity @s transformation.scale set value [1.1f,1.1f,1.1f]
data modify entity @s transformation.translation set value [0.0f,-0.9f,0.0f]
tag @s add global.ignore
tag @s add global.ignore.kill
tag @s add smithed.entity
tag @s add smithed.strict
tag @s add stardust.stardust_mob
tag @s add stardust.stardust_evoker
tag @s add stardust.model


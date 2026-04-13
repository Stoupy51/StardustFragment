
#> stardust:utils/magnet/removed
#
# @executed	as the player & at current position
#
# @within	stardust:advancements/inventory_changed
#

# Remove tag and score
tag @s remove stardust.has_item_magnet
scoreboard players remove #has_item_magnet stardust.data 1


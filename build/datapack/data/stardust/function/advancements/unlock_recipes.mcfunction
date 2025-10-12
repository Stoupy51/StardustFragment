
#> stardust:advancements/unlock_recipes
#
# @executed	as the player & at current position
#
# @within	advancement stardust:unlock_recipes
#

# Revoke advancement
advancement revoke @s only stardust:unlock_recipes

## For each ingredient in inventory, unlock the recipes
# minecraft:ender_pearl
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data if items entity @s container.* minecraft:ender_pearl
execute if score #success stardust.data matches 1 run recipe give @s stardust:dragon_pearl

# minecraft:dragon_breath
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data if items entity @s container.* minecraft:dragon_breath
execute if score #success stardust.data matches 1 run recipe give @s stardust:dragon_pearl

## Add result items
execute if items entity @s container.* *[custom_data~{"stardust": {"dragon_pearl":true} }] run recipe give @s stardust:dragon_pearl


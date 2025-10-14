
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

# minecraft:cobblestone
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data if items entity @s container.* minecraft:cobblestone
execute if score #success stardust.data matches 1 run recipe give @s stardust:compressed_cobblestone

# minecraft:black_stained_glass
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data if items entity @s container.* minecraft:black_stained_glass
execute if score #success stardust.data matches 1 run recipe give @s stardust:mirror

# minecraft:quartz_block
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data if items entity @s container.* minecraft:quartz_block
execute if score #success stardust.data matches 1 run recipe give @s stardust:mirror
execute if score #success stardust.data matches 1 run recipe give @s stardust:mirror_2

# minecraft:tinted_glass
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data if items entity @s container.* minecraft:tinted_glass
execute if score #success stardust.data matches 1 run recipe give @s stardust:mirror_2

# minecraft:barrel
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data if items entity @s container.* minecraft:barrel
execute if score #success stardust.data matches 1 run recipe give @s stardust:quarry_lv1

# minecraft:crafter
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data if items entity @s container.* minecraft:crafter
execute if score #success stardust.data matches 1 run recipe give @s stardust:quarry_lv1

# minecraft:observer
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data if items entity @s container.* minecraft:observer
execute if score #success stardust.data matches 1 run recipe give @s stardust:quarry_lv1

# minecraft:amethyst_shard
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data if items entity @s container.* minecraft:amethyst_shard
execute if score #success stardust.data matches 1 run recipe give @s stardust:quarry_lv1

# minecraft:diamond_pickaxe
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data if items entity @s container.* minecraft:diamond_pickaxe
execute if score #success stardust.data matches 1 run recipe give @s stardust:quarry_lv1

# minecraft:diamond_axe
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data if items entity @s container.* minecraft:diamond_axe
execute if score #success stardust.data matches 1 run recipe give @s stardust:quarry_lv1

# minecraft:diamond_shovel
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data if items entity @s container.* minecraft:diamond_shovel
execute if score #success stardust.data matches 1 run recipe give @s stardust:quarry_lv1

## Add result items
execute if items entity @s container.* *[custom_data~{"stardust": {"dragon_pearl":true} }] run recipe give @s stardust:dragon_pearl
execute if items entity @s container.* *[custom_data~{"stardust": {"compressed_cobblestone":true} }] run recipe give @s stardust:compressed_cobblestone
execute if items entity @s container.* *[custom_data~{"stardust": {"mirror":true} }] run recipe give @s stardust:mirror
execute if items entity @s container.* *[custom_data~{"stardust": {"mirror":true} }] run recipe give @s stardust:mirror_2
execute if items entity @s container.* *[custom_data~{"stardust": {"quarry_lv1":true} }] run recipe give @s stardust:quarry_lv1


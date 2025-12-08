
#> stardust:utils/lucky_artifact_bag
#
# @executed	as the player & at current position
#
# @within	stardust:advancements/right_click
#

# Give random artifact
loot give @s loot stardust:random_artifact

# Playsound and particles
particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0 20
playsound minecraft:entity.player.levelup ambient @s ~ ~ ~ 0.5

# Consume one lucky artifact bag
clear @s *[custom_data~{stardust:{lucky_artifact_bag:true}}] 1



#> stardust:mobs/tick/secondary
#
# @within			stardust:mobs/tick/
# @executed			as & at Model item display
#
# @description		Model is alive, check if the entity is alive or dead
#

# Score initialisation
scoreboard players set #temp stardust.data 0
scoreboard players set #success stardust.data 0
execute on vehicle unless data entity @s {Health:0.0f} run scoreboard players set #success stardust.data 1

# Define HurtTime/Death & Applying entity rotation
execute if score #success stardust.data matches 1 run function stardust:mobs/tick/is_alive
execute if score #success stardust.data matches 0 run function stardust:mobs/tick/is_killing

# Depending on the entity, display a model
execute unless score #temp stardust.data matches 0 run function stardust:mobs/tick/models


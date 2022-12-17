
#Score initialisation
scoreboard players set #temp stardust.data 0
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data if predicate stardust:has_vehicle

#Define HurtTime/Death & Applying entity rotation
execute if score #success stardust.data matches 1 run function stardust:mobs/tick/is_alive
execute if score #success stardust.data matches 0 run function stardust:mobs/tick/is_killing

#Depending on the entity, display a model
execute unless score #temp stardust.data matches 0 run function stardust:mobs/tick/models


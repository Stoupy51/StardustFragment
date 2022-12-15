
#Score initialisation
scoreboard players add @s stardust.cooldown 0
scoreboard players set #temp stardust.data 0
scoreboard players set #success stardust.data 0
scoreboard players set #hurt_time stardust.data 0
scoreboard players operation #predicate stardust.data = @s stardust.id
execute store success score #success stardust.data run data modify storage stardust:temp all set from entity @e[type=!armor_stand,tag=stardust.stardust_mob,distance=..10,predicate=stardust:equals_id,limit=1]

#Define HurtTime/Death & Applying entity rotation
execute if score #success stardust.data matches 1 run function stardust:mobs/tick/is_alive
execute if score #success stardust.data matches 0 run function stardust:mobs/tick/is_killing

#Depending on the entity, display a model
function stardust:mobs/tick/models

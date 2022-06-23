
#Score initialisation
scoreboard players set #temp stardust.data 0
scoreboard players set #success stardust.data 0
scoreboard players set #hurt_time stardust.data 0
scoreboard players operation #predicate stardust.data = @s stardust.id
execute store success score #success stardust.data run data modify storage stardust:main temp set from entity @e[type=!armor_stand,tag=stardust.stardust_dim,distance=..2,predicate=stardust:equals_id,limit=1]
execute if score #success stardust.data matches 1 store result score #hurt_time stardust.data run data get storage stardust:main temp.HurtTime
execute if score #success stardust.data matches 0 run kill @s

execute if entity @s[tag=stardust.stardust_soldier] run function stardust:mobs/tick_2/stardust_soldier
execute if entity @s[tag=stardust.stardust_evoker] run function stardust:mobs/tick_2/stardust_evoker

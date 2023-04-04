
# Small randomizer to spawn the Stardust mobs
scoreboard players set #temp stardust.data 1
execute if entity @s[type=bat] run scoreboard players set #temp stardust.data 2
execute if score #temp stardust.data matches 1 if predicate stardust:random_0_75 run scoreboard players set #temp stardust.data 0
execute if score #temp stardust.data matches 1 if predicate stardust:random_0_5 run scoreboard players set #temp stardust.data -1
execute if score #temp stardust.data matches 2 if predicate stardust:random_0_25 run scoreboard players set #temp stardust.data -1

# Switch case to spawn the Stardust mob
execute if score #temp stardust.data matches 0 run function stardust:mobs/stardust_soldier
execute if score #temp stardust.data matches 1 run function stardust:mobs/stardust_evoker
execute if score #temp stardust.data matches 2 run function stardust:mobs/stardust_bat

# Kill the vanilla entity
tp @s 0 -10000 0
kill @s


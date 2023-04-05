
#> stardust:boss/stardust_pillar/defeated
#
# @within			stardust:boss/stardust_pillar/tick
# @executed			as & at the Stardust Pillar model
#
# @description		Function executed when the Stardust Pillar is defeated
#

# Loot the players (2x Keys, 2x Stardust Essence) & message them
execute as @a[distance=..200] at @e[limit=2] run loot give @s loot stardust:i/stardust_dungeon_key
execute as @a[distance=..200] at @e[limit=4] run loot give @s loot stardust:i/stardust_essence
tellraw @a[distance=..200] ["",{"text":"[Stardust","italic":false,"color":"dark_aqua"},{"text":"Fragment]","italic":false,"color":"aqua"},{"text":" The Stardust Pillar has been defeated."}]

# Playsound death (random between 4 sounds)
execute store result score #temp stardust.data run data get entity @s UUID[0]
scoreboard players operation #temp stardust.data %= #4 simplenergy.data
execute if score #temp stardust.data matches 0 as @a[distance=..200] at @s run playsound stardust:stardust_pillar_death_1 hostile @s
execute if score #temp stardust.data matches 1 as @a[distance=..200] at @s run playsound stardust:stardust_pillar_death_2 hostile @s
execute if score #temp stardust.data matches 2 as @a[distance=..200] at @s run playsound stardust:stardust_pillar_death_3 hostile @s
execute if score #temp stardust.data matches 3 as @a[distance=..200] at @s run playsound stardust:stardust_pillar_death_4 hostile @s

# Kill model
kill @s


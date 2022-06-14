
execute as @a[distance=..200] at @e[limit=2] run loot give @s loot stardust:i/stardust_dungeon_key
execute as @a[distance=..200] at @e[limit=4] run loot give @s loot stardust:i/stardust_essence

tellraw @a[distance=..200] ["",{"text":"[Stardust","italic":false,"color":"dark_aqua"},{"text":"Fragment]","italic":false,"color":"aqua"},{"text":" The Stardust Pillar has been defeated."}]

#Playsound death
execute store result score #temp stardust.data run data get entity @s UUID[0]
scoreboard players operation #temp stardust.data %= #4 simplenergy.data
execute if score #temp stardust.data matches 0 as @a[distance=..200] at @s run playsound stardust:stardust_pillar_death_1 master @s
execute if score #temp stardust.data matches 1 as @a[distance=..200] at @s run playsound stardust:stardust_pillar_death_2 master @s
execute if score #temp stardust.data matches 2 as @a[distance=..200] at @s run playsound stardust:stardust_pillar_death_3 master @s
execute if score #temp stardust.data matches 3 as @a[distance=..200] at @s run playsound stardust:stardust_pillar_death_4 master @s

kill @s
execute if score #stardust_pillar stardust.data matches 1 unless entity @e[tag=stardust.pillar_tick] run scoreboard players remove #stardust_pillar stardust.data 1

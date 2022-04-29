
execute unless block ~ ~ ~ #stardust:non_solid run scoreboard players set #temp stardust.data 0
execute if entity @s[distance=..100] if score #temp stardust.data matches 1 positioned ~ ~1 ~ run function stardust:work/solar_panel/check

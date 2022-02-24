
execute unless block ~ ~ ~ #stardust:non_solid run scoreboard players set Temp StardustFragment_Data 0
execute if entity @s[distance=..100] if score Temp StardustFragment_Data matches 1 positioned ~ ~1 ~ run function stardust:work/photovoltaic_panel/check

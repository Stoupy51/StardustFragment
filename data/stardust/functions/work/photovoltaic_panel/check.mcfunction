scoreboard players add Count SF_Data 1
execute unless block ~ ~ ~ #stardust:non_solid run scoreboard players set Temp SF_Data 0
execute if score Count SF_Data matches ..100 if block ~ ~ ~ #stardust:non_solid positioned ~ ~1 ~ run function stardust:work/photovoltaic_panel/check

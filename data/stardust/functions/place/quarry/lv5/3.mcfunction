scoreboard players set @s EF_kJmax 180000
scoreboard players set @s EF_kW 625
scoreboard players operation @s EF_kJ = EF_Next EF_kJ
scoreboard players reset EF_Next EF_kJ
tag @s remove SF_SetNew

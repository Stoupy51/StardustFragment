scoreboard players set @s EF_EnergyStorage 180000
scoreboard players set @s EF_Watt 1250
scoreboard players operation @s EF_Joule = EF_Next EF_Joule
scoreboard players reset EF_Next EF_Joule
tag @s remove SF_SetNew

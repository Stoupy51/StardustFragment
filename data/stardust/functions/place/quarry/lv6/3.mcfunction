scoreboard players set @s EF_EnergyStorage 1
scoreboard players set @s EF_Watt 0
scoreboard players operation @s EF_Joule = EF_Next EF_Joule
scoreboard players reset EF_Next EF_Joule
tag @s remove SF_SetNew

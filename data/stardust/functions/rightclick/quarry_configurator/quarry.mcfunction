scoreboard players operation @s SF_Qx1 = Qx1 SF_X
scoreboard players operation @s SF_Qy1 = Qy1 SF_X
scoreboard players operation @s SF_Qz1 = Qz1 SF_X
scoreboard players operation @s SF_Qx2 = Qx2 SF_X
scoreboard players operation @s SF_Qy2 = Qy2 SF_X
scoreboard players operation @s SF_Qz2 = Qz2 SF_X
tellraw @a[tag=SF_Temp] [{"text":"Quarry has been successfully configured","color":"green"}]
tag @a[tag=SF_Temp] remove SF_Temp

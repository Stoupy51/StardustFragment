
scoreboard players operation @s stardust.quarry_x1 = Qx1 stardust.data_2
scoreboard players operation @s stardust.quarry_y1 = Qy1 stardust.data_2
scoreboard players operation @s stardust.quarry_z1 = Qz1 stardust.data_2
scoreboard players operation @s stardust.quarry_x2 = Qx2 stardust.data_2
scoreboard players operation @s stardust.quarry_y2 = Qy2 stardust.data_2
scoreboard players operation @s stardust.quarry_z2 = Qz2 stardust.data_2
tellraw @a[tag=stardust.temp] [{"text":"Quarry has been successfully configured","color":"green"}]
tag @a[tag=stardust.temp] remove stardust.temp

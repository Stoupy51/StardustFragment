scoreboard players enable @a SF_ResetQ
execute unless score @s SF_Qx1 matches -2147483648.. run function stardust:quarry/select/reset1
execute unless score @s SF_Qx2 matches -2147483648.. run function stardust:quarry/select/reset2

scoreboard players operation @s SF_Qx1 = @a[distance=..3] SF_Qx1
scoreboard players operation @s SF_Qy1 = @a[distance=..3] SF_Qy1
scoreboard players operation @s SF_Qz1 = @a[distance=..3] SF_Qz1
scoreboard players operation @s SF_Qx2 = @a[distance=..3] SF_Qx2
scoreboard players operation @s SF_Qy2 = @a[distance=..3] SF_Qy2
scoreboard players operation @s SF_Qz2 = @a[distance=..3] SF_Qz2

scoreboard players reset @a SF_Qx1
scoreboard players reset @a SF_Qy1
scoreboard players reset @a SF_Qz1
scoreboard players reset @a SF_Qx2
scoreboard players reset @a SF_Qy2
scoreboard players reset @a SF_Qz2
scoreboard players enable @a SF_Qx1
scoreboard players enable @a SF_Qy1
scoreboard players enable @a SF_Qz1
scoreboard players enable @a SF_Qx2
scoreboard players enable @a SF_Qy2
scoreboard players enable @a SF_Qz2

function stardust:quarry/calcsize
title @a[distance=..3] actionbar [{"text":"Quarry ","color":"gold"},{"text":"X : ","color":"dark_red"},{"score":{"name":"@s","objective":"SF_Qx1"},"color":"dark_red"},{"text":" to ","color":"dark_red"},{"score":{"name":"@s","objective":"SF_Qx2"},"color":"dark_red"},{"text":" SF_Y : ","color":"green"},{"score":{"name":"@s","objective":"SF_Qy1"},"color":"green"},{"text":" to ","color":"green"},{"score":{"name":"@s","objective":"SF_Qy2"},"color":"green"},{"text":" SF_Z : ","color":"blue"},{"score":{"name":"@s","objective":"SF_Qz1"},"color":"blue"},{"text":" to ","color":"blue"},{"score":{"name":"@s","objective":"SF_Qz2"},"color":"blue"},{"text":" Size : ","color":"gold"},{"score":{"name":"@s","objective":"SF_SizeQ"},"color":"gold"}]

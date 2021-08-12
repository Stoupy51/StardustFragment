scoreboard players enable @a SF_ResetQ
execute if score @s SF_Qx1 matches 0 run function stardust:quarry/select/reset1
execute if score @s SF_Qx2 matches 0 run function stardust:quarry/select/reset2

execute at @a[distance=..3] unless score @p SF_Qx1 matches 0 run scoreboard players operation @s SF_Qx1 = @p SF_Qx1
execute at @a[distance=..3] unless score @p SF_Qy1 matches 0 run scoreboard players operation @s SF_Qy1 = @p SF_Qy1
execute at @a[distance=..3] unless score @p SF_Qz1 matches 0 run scoreboard players operation @s SF_Qz1 = @p SF_Qz1
execute at @a[distance=..3] unless score @p SF_Qx2 matches 0 run scoreboard players operation @s SF_Qx2 = @p SF_Qx2
execute at @a[distance=..3] unless score @p SF_Qy2 matches 0 run scoreboard players operation @s SF_Qy2 = @p SF_Qy2
execute at @a[distance=..3] unless score @p SF_Qz2 matches 0 run scoreboard players operation @s SF_Qz2 = @p SF_Qz2

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
title @a[distance=..3] actionbar [{"text":"Quarry ","color":"gold"},{"text":"X : ","color":"dark_red"},{"score":{"name":"@s","objective":"SF_Qx1"},"color":"dark_red"},{"text":" to ","color":"dark_red"},{"score":{"name":"@s","objective":"SF_Qx2"},"color":"dark_red"},{"text":" Y : ","color":"green"},{"score":{"name":"@s","objective":"SF_Qy1"},"color":"green"},{"text":" to ","color":"green"},{"score":{"name":"@s","objective":"SF_Qy2"},"color":"green"},{"text":" Z : ","color":"blue"},{"score":{"name":"@s","objective":"SF_Qz1"},"color":"blue"},{"text":" to ","color":"blue"},{"score":{"name":"@s","objective":"SF_Qz2"},"color":"blue"},{"text":" Size : ","color":"gold"},{"score":{"name":"@s","objective":"SF_SizeQ"},"color":"gold"}]

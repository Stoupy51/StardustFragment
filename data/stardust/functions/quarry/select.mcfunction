scoreboard players enable @a SF_ResetQ
execute as @s[tag=!SF_QuarryReset] run function stardust:quarry/reset
tag @s add SF_QuarryReset

execute at @a[distance=..3] unless score @p SF_Qx1 matches 0 run scoreboard players operation @s SF_Qx1 = @p SF_Qx1
execute at @a[distance=..3] unless score @p SF_Qy1 matches 0 run scoreboard players operation @s SF_Qy1 = @p SF_Qy1
execute at @a[distance=..3] unless score @p SF_Qz1 matches 0 run scoreboard players operation @s SF_Qz1 = @p SF_Qz1
execute at @a[distance=..3] unless score @p SF_Qx2 matches 0 run scoreboard players operation @s SF_Qx2 = @p SF_Qx2
execute at @a[distance=..3] unless score @p SF_Qy2 matches 0 run scoreboard players operation @s SF_Qy2 = @p SF_Qy2
execute at @a[distance=..3] unless score @p SF_Qz2 matches 0 run scoreboard players operation @s SF_Qz2 = @p SF_Qz2

function stardust:quarry/calcsize
title @a[distance=..3] actionbar [{"text":"Quarry ","italic":false,"color":"gold"},{"text":"X : ","italic":false,"color":"dark_red"},{"score":{"name":"@s","objective":"SF_Qx1"},"italic":false,"color":"dark_red"},{"text":" to ","italic":false,"color":"dark_red"},{"score":{"name":"@s","objective":"SF_Qx2"},"italic":false,"color":"dark_red"},{"text":" Y : ","italic":false,"color":"green"},{"score":{"name":"@s","objective":"SF_Qy1"},"italic":false,"color":"green"},{"text":" to ","italic":false,"color":"green"},{"score":{"name":"@s","objective":"SF_Qy2"},"italic":false,"color":"green"},{"text":" Z : ","italic":false,"color":"blue"},{"score":{"name":"@s","objective":"SF_Qz1"},"italic":false,"color":"blue"},{"text":" to ","italic":false,"color":"blue"},{"score":{"name":"@s","objective":"SF_Qz2"},"italic":false,"color":"blue"},{"text":" Size : ","italic":false,"color":"gold"},{"score":{"name":"@s","objective":"SF_SizeQ"},"italic":false,"color":"gold"}]

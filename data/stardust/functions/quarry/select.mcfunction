
execute if entity @s[tag=!stardust.quarry_reset] run function stardust:quarry/reset
tag @s add stardust.quarry_reset

function stardust:quarry/calcsize
title @a[tag=!global.ignore.gui,distance=..3] actionbar [{"text":"Quarry ","italic":false,"color":"gold"},{"text":"X : ","italic":false,"color":"dark_red"},{"score":{"name":"@s","objective":"stardust.quarry_x1"},"italic":false,"color":"dark_red"},{"text":" to ","italic":false,"color":"dark_red"},{"score":{"name":"@s","objective":"stardust.quarry_x2"},"italic":false,"color":"dark_red"},{"text":" Y : ","italic":false,"color":"green"},{"score":{"name":"@s","objective":"stardust.quarry_y1"},"italic":false,"color":"green"},{"text":" to ","italic":false,"color":"green"},{"score":{"name":"@s","objective":"stardust.quarry_y2"},"italic":false,"color":"green"},{"text":" Z : ","italic":false,"color":"blue"},{"score":{"name":"@s","objective":"stardust.quarry_z1"},"italic":false,"color":"blue"},{"text":" to ","italic":false,"color":"blue"},{"score":{"name":"@s","objective":"stardust.quarry_z2"},"italic":false,"color":"blue"},{"text":" Size : ","italic":false,"color":"gold"},{"score":{"name":"@s","objective":"stardust.quarry_size"},"italic":false,"color":"gold"}]


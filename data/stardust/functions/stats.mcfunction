
function simplenergy:stats
tellraw @s [{"text":"\n[Stardust","color":"aqua"},{"text":"Fragment","color":"dark_aqua"},{"text":" Stats]","color":"aqua"}]

execute store result score temp stardust.data if entity @e[type=glow_item_frame,tag=stardust.destroyer]
tellraw @s ["",{"text":"Custom blocks loaded: ","color":"gray"},{"score":{"name":"temp","objective":"stardust.data"},"color":"gold"}]

execute store result score temp stardust.data if entity @e[type=glow_item_frame,tag=stardust.seed]
tellraw @s ["",{"text":"Custom seeds: ","color":"gray"},{"score":{"name":"temp","objective":"stardust.data"},"color":"gold"}]

execute store result score temp stardust.data if entity @e[type=glow_item_frame,tag=stardust.ore]
tellraw @s ["",{"text":"Custom ores: ","color":"gray"},{"score":{"name":"temp","objective":"stardust.data"},"color":"gold"}]

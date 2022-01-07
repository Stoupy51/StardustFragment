
function simplenergy:stats
tellraw @s [{"text":"\n[Stardust","color":"aqua"},{"text":"Fragment","color":"dark_aqua"},{"text":" Stats]","color":"aqua"}]

execute store result score Temp StardustFragment_Data if entity @e[type=glow_item_frame,tag=StardustFragment_Destroyer]
tellraw @s ["",{"text":"Custom blocks loaded: ","color":"gray"},{"score":{"name":"Temp","objective":"StardustFragment_Data"},"color":"gold"}]

execute store result score Temp StardustFragment_Data if entity @e[type=glow_item_frame,tag=StardustFragment_Seed]
tellraw @s ["",{"text":"Custom seeds: ","color":"gray"},{"score":{"name":"Temp","objective":"StardustFragment_Data"},"color":"gold"}]

execute store result score Temp StardustFragment_Data if entity @e[type=glow_item_frame,tag=StardustFragment_Ore]
tellraw @s ["",{"text":"Custom ores: ","color":"gray"},{"score":{"name":"Temp","objective":"StardustFragment_Data"},"color":"gold"}]

execute store result score Temp StardustFragment_Data if entity @e[type=marker,tag=StardustFragment_ChunkScan]
tellraw @s ["",{"text":"Chunks markers: ","color":"gray"},{"score":{"name":"Temp","objective":"StardustFragment_Data"},"color":"gold"}]

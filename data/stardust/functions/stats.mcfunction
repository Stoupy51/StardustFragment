
function simplenergy:stats
tellraw @s [{"text":"\n[Stardust","color":"aqua"},{"text":"Fragment","color":"dark_aqua"},{"text":" Stats]","color":"aqua"}]

execute store result score Temp SF_Data if entity @e[type=glow_item_frame,tag=SF_Destroyer]
tellraw @s ["",{"text":"Custom blocks loaded: ","color":"gray"},{"score":{"name":"Temp","objective":"SF_Data"},"color":"gold"}]

execute store result score Temp SF_Data if entity @e[type=glow_item_frame,tag=SF_Seed]
tellraw @s ["",{"text":"Custom seeds: ","color":"gray"},{"score":{"name":"Temp","objective":"SF_Data"},"color":"gold"}]

execute store result score Temp SF_Data if entity @e[type=glow_item_frame,tag=SF_Ore]
tellraw @s ["",{"text":"Custom ores: ","color":"gray"},{"score":{"name":"Temp","objective":"SF_Data"},"color":"gold"}]

execute store result score Temp SF_Data if entity @e[type=marker,tag=SF_ChunkScan]
tellraw @s ["",{"text":"Chunks markers: ","color":"gray"},{"score":{"name":"Temp","objective":"SF_Data"},"color":"gold"}]

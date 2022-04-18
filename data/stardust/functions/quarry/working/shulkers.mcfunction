
execute store result entity @s Pos[0] double 1 run scoreboard players get Qx stardust.data
execute store result entity @s Pos[1] double 1 run scoreboard players get Qy stardust.data
execute store result entity @s Pos[2] double 1 run scoreboard players get Qz stardust.data
execute at @s positioned ~0.5 ~ ~0.5 unless block ~ ~ ~ #stardust:quarry run summon shulker ~ ~ ~ {Tags:["stardust.quarryMiner","stardust.quarry_displaying"],DeathLootTable:"none",AttachFace:0,Color:0b,Invulnerable:1,NoAI:1,Silent:1,Glowing:1b,Team:"stardust.shulker"}
execute if score #count stardust.data matches 1 if score #temp stardust.data matches 0 at @s positioned ~0.5 ~ ~0.5 run summon shulker ~ ~ ~ {Tags:["stardust.quarryMiner","stardust.quarry_displaying"],DeathLootTable:"none",AttachFace:0,Color:0b,Invulnerable:1,NoAI:1,Silent:1,Glowing:1b,Team:"stardust.shulker"}
kill @s

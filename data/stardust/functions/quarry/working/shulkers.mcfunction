
execute store result entity @s Pos[0] double 1 run scoreboard players get Qx stardust.data
execute store result entity @s Pos[1] double 1 run scoreboard players get Qy stardust.data
execute store result entity @s Pos[2] double 1 run scoreboard players get Qz stardust.data

scoreboard players set #is_hidden stardust.data 1
execute store success score #is_hidden stardust.data at @s unless entity @a[distance=..25]
execute if score #is_hidden stardust.data matches 0 at @s positioned ~0.5 ~ ~0.5 unless block ~ ~ ~ #stardust:quarry run summon shulker ~ ~ ~ {Tags:["stardust.quarryMiner","stardust.quarry_displaying"],DeathLootTable:"none",AttachFace:0,Color:0b,Invulnerable:1,NoAI:1,Silent:1,Glowing:1b,Team:"stardust.shulker"}
execute if score #quarry_count stardust.data matches 1 if score #quarry_temp stardust.data matches 0 at @s positioned ~0.5 ~ ~0.5 run summon shulker ~ ~ ~ {Tags:["stardust.quarryMiner","stardust.quarry_displaying"],DeathLootTable:"none",AttachFace:0,Color:0b,Invulnerable:1,NoAI:1,Silent:1,Glowing:1b,Team:"stardust.shulker"}

scoreboard players remove #quarry_count stardust.data 1
execute at @s align xyz run function stardust:quarry/working/mine

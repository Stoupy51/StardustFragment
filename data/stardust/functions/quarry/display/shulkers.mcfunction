execute store result entity @s Pos[0] double 1 run scoreboard players get Qx1 stardust.data
execute store result entity @s Pos[1] double 1 run scoreboard players get Qy1 stardust.data
execute store result entity @s Pos[2] double 1 run scoreboard players get Qz1 stardust.data
execute at @s positioned ~0.5 ~ ~0.5 run summon shulker ~ ~ ~ {Tags:["stardust.quarryDisplayX","stardust.quarryDisplay1"],DeathLootTable:"none",AttachFace:0,Color:14b,Invulnerable:1,NoAI:1,Silent:1,Glowing:1b,Team:"stardust.red"}

execute store result entity @s Pos[0] double 1 run scoreboard players get Qx2 stardust.data
execute store result entity @s Pos[1] double 1 run scoreboard players get Qy2 stardust.data
execute store result entity @s Pos[2] double 1 run scoreboard players get Qz2 stardust.data
execute at @s positioned ~0.5 ~ ~0.5 run summon shulker ~ ~ ~ {Tags:["stardust.quarryDisplayX","stardust.quarryDisplay2"],DeathLootTable:"none",AttachFace:0,Color:3b,Invulnerable:1,NoAI:1,Silent:1,Glowing:1b,Team:"stardust.blue"}
kill @s

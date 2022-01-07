execute store result entity @s Pos[0] double 1 run scoreboard players get Qx1 StardustFragment_Data
execute store result entity @s Pos[1] double 1 run scoreboard players get Qy1 StardustFragment_Data
execute store result entity @s Pos[2] double 1 run scoreboard players get Qz1 StardustFragment_Data
execute at @s positioned ~0.5 ~ ~0.5 run summon shulker ~ ~ ~ {Tags:["StardustFragment_QuarryDisplayX","StardustFragment_QuarryDisplay1"],DeathLootTable:"none",AttachFace:0,Color:14b,Invulnerable:1,NoAI:1,Silent:1,Glowing:1b,Team:"StardustFragment_Red"}

execute store result entity @s Pos[0] double 1 run scoreboard players get Qx2 StardustFragment_Data
execute store result entity @s Pos[1] double 1 run scoreboard players get Qy2 StardustFragment_Data
execute store result entity @s Pos[2] double 1 run scoreboard players get Qz2 StardustFragment_Data
execute at @s positioned ~0.5 ~ ~0.5 run summon shulker ~ ~ ~ {Tags:["StardustFragment_QuarryDisplayX","StardustFragment_QuarryDisplay2"],DeathLootTable:"none",AttachFace:0,Color:3b,Invulnerable:1,NoAI:1,Silent:1,Glowing:1b,Team:"StardustFragment_Blue"}
kill @s

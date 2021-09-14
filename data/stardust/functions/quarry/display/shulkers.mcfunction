execute store result entity @s Pos[0] double 1 run scoreboard players get Qx1 SF_Data
execute store result entity @s Pos[1] double 1 run scoreboard players get Qy1 SF_Data
execute store result entity @s Pos[2] double 1 run scoreboard players get Qz1 SF_Data
execute at @s positioned ~0.5 ~ ~0.5 run summon shulker ~ ~ ~ {Tags:["SF_QuarryDisplayX","SF_QuarryDisplay1"],DeathLootTable:"none",AttachFace:0,Color:14b,Invulnerable:1,NoAI:1,Silent:1,Glowing:1b,Team:"SF_Red"}

execute store result entity @s Pos[0] double 1 run scoreboard players get Qx2 SF_Data
execute store result entity @s Pos[1] double 1 run scoreboard players get Qy2 SF_Data
execute store result entity @s Pos[2] double 1 run scoreboard players get Qz2 SF_Data
execute at @s positioned ~0.5 ~ ~0.5 run summon shulker ~ ~ ~ {Tags:["SF_QuarryDisplayX","SF_QuarryDisplay2"],DeathLootTable:"none",AttachFace:0,Color:3b,Invulnerable:1,NoAI:1,Silent:1,Glowing:1b,Team:"SF_Blue"}
kill @s

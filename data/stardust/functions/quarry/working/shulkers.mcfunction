execute store result entity @s Pos[0] double 1 run scoreboard players get Qx SF_Data
execute store result entity @s Pos[1] double 1 run scoreboard players get Qy SF_Data
execute store result entity @s Pos[2] double 1 run scoreboard players get Qz SF_Data
execute at @s positioned ~0.5 ~ ~0.5 unless block ~ ~ ~ #stardust:quarry run summon shulker ~ ~ ~ {Tags:["SF_QuarryMiner","SF_QuarryDisplayX"],DeathLootTable:"none",AttachFace:0,Color:0b,Invulnerable:1,NoAI:1,Silent:1,Glowing:1b}
execute if score Count SF_Data matches 1 if score Temp SF_Data matches 0 at @s positioned ~0.5 ~ ~0.5 run summon shulker ~ ~ ~ {Tags:["SF_QuarryMiner","SF_QuarryDisplayX"],DeathLootTable:"none",AttachFace:0,Color:0b,Invulnerable:1,NoAI:1,Silent:1,Glowing:1b}
kill @s

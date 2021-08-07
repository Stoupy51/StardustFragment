summon minecraft:marker ~ 0 ~ {Tags:["SF_ChunkInit","SF_ChunkScan","SF_ChunkGen"]}
execute as @e[type=minecraft:marker,tag=SF_ChunkInit] at @s run function stardust:generate/init_2

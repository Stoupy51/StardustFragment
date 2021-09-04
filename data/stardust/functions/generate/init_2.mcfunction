#Remove digits
    execute store result entity @s Pos[0] int 1 run data get entity @s Pos[0]
    execute store result entity @s Pos[2] int 1 run data get entity @s Pos[2]

#Generate Stardust Ore (x8) at y=25
#Or Awakened Stardust Ore (x5) at y=25 in minecraft:the_nether
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    execute in minecraft:the_nether as @e[type=marker,tag=SF_OrePos,distance=0..,limit=5] at @s run function stardust:generate/awakened_stardust
    execute as @e[type=marker,tag=SF_OrePos] at @s run function stardust:generate/stardust

#Generate Quadruple Compressed Cobblestone
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    summon minecraft:marker ~ 25 ~ {Tags:["SF_OrePos"]}
    execute in stardust:stardust as @e[type=marker,tag=SF_OrePos,distance=0..,limit=8] at @s run function stardust:generate/quadruple_compressed_cobblestone
    execute in stardust:stardust as @e[type=marker,tag=SF_OrePos,distance=0..,limit=8] at @s run function stardust:generate/stardust
    kill @e[type=marker,tag=SF_OrePos]

tag @s remove SF_ChunkInit

#Check for a unvisited zone
    execute positioned ~75 0 ~75 unless entity @e[distance=..76,type=minecraft:marker,tag=SF_ChunkScan] run function stardust:generate/init
    execute positioned ~-75 0 ~75 unless entity @e[distance=..76,type=minecraft:marker,tag=SF_ChunkScan] run function stardust:generate/init
    execute positioned ~75 0 ~-75 unless entity @e[distance=..76,type=minecraft:marker,tag=SF_ChunkScan] run function stardust:generate/init
    execute positioned ~-75 0 ~-75 unless entity @e[distance=..76,type=minecraft:marker,tag=SF_ChunkScan] run function stardust:generate/init

    execute positioned ~ 0 ~75 unless entity @e[distance=..76,type=minecraft:marker,tag=SF_ChunkScan] run function stardust:generate/init
    execute positioned ~75 0 ~ unless entity @e[distance=..76,type=minecraft:marker,tag=SF_ChunkScan] run function stardust:generate/init
    execute positioned ~-75 0 ~ unless entity @e[distance=..76,type=minecraft:marker,tag=SF_ChunkScan] run function stardust:generate/init
    execute positioned ~ 0 ~-75 unless entity @e[distance=..76,type=minecraft:marker,tag=SF_ChunkScan] run function stardust:generate/init


advancement grant @s only stardust:visible/adventure/ultimate_spawner
setblock ~ ~ ~ spawner{SpawnCount:1,SpawnData:{entity:{id:"minecraft:item",Item:{id:"minecraft:diamond",Count:1b}}},SpawnPotentials:[]}

data modify block ~ ~ ~ SpawnPotentials append value {weight:500,data:{entity:{id:"minecraft:item",Item:{id:"cobblestone",Count:1b}}}}
data modify block ~ ~ ~ SpawnPotentials append value {weight:150,data:{entity:{id:"minecraft:item",Item:{id:"cobblestone",Count:1b}}}}
data modify block ~ ~ ~ SpawnPotentials append value {weight:120,data:{entity:{id:"minecraft:item",Item:{id:"cobblestone",Count:1b}}}}
data modify block ~ ~ ~ SpawnPotentials append value {weight:100,data:{entity:{id:"minecraft:item",Item:{id:"cobblestone",Count:1b}}}}
data modify block ~ ~ ~ SpawnPotentials append value {weight:80,data:{entity:{id:"minecraft:item",Item:{id:"cobblestone",Count:1b}}}}
data modify block ~ ~ ~ SpawnPotentials append value {weight:50,data:{entity:{id:"minecraft:item",Item:{id:"cobblestone",Count:1b}}}}
data modify block ~ ~ ~ SpawnPotentials append value {weight:50,data:{entity:{id:"minecraft:item",Item:{id:"cobblestone",Count:1b}}}}
data modify block ~ ~ ~ SpawnPotentials append value {weight:25,data:{entity:{id:"minecraft:item",Item:{id:"cobblestone",Count:1b}}}}
data modify block ~ ~ ~ SpawnPotentials append value {weight:20,data:{entity:{id:"minecraft:item",Item:{id:"cobblestone",Count:1b}}}}
data modify block ~ ~ ~ SpawnPotentials append value {weight:15,data:{entity:{id:"minecraft:item",Item:{id:"cobblestone",Count:1b}}}}
data modify block ~ ~ ~ SpawnPotentials append value {weight:10,data:{entity:{id:"minecraft:item",Item:{id:"cobblestone",Count:1b}}}}
data modify block ~ ~ ~ SpawnPotentials append value {weight:9,data:{entity:{id:"minecraft:item",Item:{id:"cobblestone",Count:1b}}}}
data modify block ~ ~ ~ SpawnPotentials append value {weight:7,data:{entity:{id:"minecraft:item",Item:{id:"cobblestone",Count:1b}}}}
data modify block ~ ~ ~ SpawnPotentials append value {weight:5,data:{entity:{id:"minecraft:item",Item:{id:"cobblestone",Count:1b}}}}
data modify block ~ ~ ~ SpawnPotentials append value {weight:2,data:{entity:{id:"minecraft:item",Item:{id:"cobblestone",Count:1b}}}}
data modify block ~ ~ ~ SpawnPotentials append value {weight:2,data:{entity:{id:"minecraft:item",Item:{id:"cobblestone",Count:1b}}}}
data modify block ~ ~ ~ SpawnPotentials append value {weight:2,data:{entity:{id:"minecraft:item",Item:{id:"cobblestone",Count:1b}}}}
data modify block ~ ~ ~ SpawnPotentials append value {weight:2,data:{entity:{id:"minecraft:item",Item:{id:"cobblestone",Count:1b}}}}
data modify block ~ ~ ~ SpawnPotentials append value {weight:1,data:{entity:{id:"minecraft:item",Item:{id:"cobblestone",Count:1b}}}}

data modify block ~ ~ ~ SpawnData.entity.Item set from storage stardust:main all.2013000
data modify block ~ ~ ~ SpawnPotentials[0].data.entity.Item set from storage stardust:main all.2013000
data modify block ~ ~ ~ SpawnPotentials[0].data.entity.Item.Count set value 4b
data modify block ~ ~ ~ SpawnPotentials[1].data.entity.Item set value {id:"minecraft:iron_ingot",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[2].data.entity.Item set value {id:"minecraft:gold_ingot",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[3].data.entity.Item set value {id:"minecraft:copper_ingot",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[4].data.entity.Item set value {id:"minecraft:diamond",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[5].data.entity.Item set value {id:"minecraft:netherite_scrap",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[6].data.entity.Item set from storage stardust:main all.2013218
data modify block ~ ~ ~ SpawnPotentials[7].data.entity.Item set value {id:"minecraft:enchanted_golden_apple",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[8].data.entity.Item set value {id:"minecraft:netherite_ingot",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[9].data.entity.Item set from storage stardust:main all.2013003
data modify block ~ ~ ~ SpawnPotentials[10].data.entity.Item set value {id:"minecraft:dragon_egg",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[11].data.entity.Item set from storage stardust:main all.2013005
data modify block ~ ~ ~ SpawnPotentials[12].data.entity.Item set value {id:"minecraft:nether_star",Count:4b}
data modify block ~ ~ ~ SpawnPotentials[13].data.entity.Item set from storage stardust:main all.2013217
data modify block ~ ~ ~ SpawnPotentials[14].data.entity.Item set from storage stardust:main all.2013006
data modify block ~ ~ ~ SpawnPotentials[15].data.entity.Item set from storage stardust:main all.2013008
data modify block ~ ~ ~ SpawnPotentials[16].data.entity.Item set from storage stardust:main all.2013009
data modify block ~ ~ ~ SpawnPotentials[17].data.entity.Item set from storage stardust:main all.2013010
data modify block ~ ~ ~ SpawnPotentials[18].data.entity.Item set value {id:"minecraft:netherite_block",Count:16b}

execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function stardust:place/ultimate_spawner/secondary

particle flame ~ ~ ~ 0.5 0.5 0.5 0.01 100

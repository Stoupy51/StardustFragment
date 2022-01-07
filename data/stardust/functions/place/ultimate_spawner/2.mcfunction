setblock ~ ~ ~ spawner{SpawnCount:1,SpawnData:{entity:{id:"minecraft:item",Item:{id:"minecraft:diamond",Count:1b}}},SpawnPotentials:[{weight:500,data:{entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}}},{weight:150,data:{entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}}},{weight:120,data:{entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}}},{weight:100,data:{entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}}},{weight:80,data:{entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}}},{weight:50,data:{entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}}},{weight:50,data:{entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}}},{weight:25,data:{entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}}},{weight:20,data:{entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}}},{weight:15,data:{entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}}},{weight:10,data:{entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}}},{weight:9,data:{entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}}},{weight:7,data:{entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}}},{weight:5,data:{entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}}},{weight:2,data:{entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}}},{weight:2,data:{entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}}},{weight:2,data:{entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}}},{weight:2,data:{entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}}},{weight:1,data:{entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}}}]}

data modify block ~ ~ ~ SpawnData.entity.Item set from storage stardust:items all.2013000
data modify block ~ ~ ~ SpawnPotentials[0].data.entity.Item set from storage stardust:items all.2013000
data modify block ~ ~ ~ SpawnPotentials[0].data.entity.Item.Count set value 4b
data modify block ~ ~ ~ SpawnPotentials[1].data.entity.Item set value {id:"minecraft:iron_ingot",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[2].data.entity.Item set value {id:"minecraft:gold_ingot",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[3].data.entity.Item set value {id:"minecraft:copper_ingot",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[4].data.entity.Item set value {id:"minecraft:diamond",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[5].data.entity.Item set value {id:"minecraft:netherite_scrap",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[6].data.entity.Item set from storage stardust:items all.2013229
data modify block ~ ~ ~ SpawnPotentials[7].data.entity.Item set value {id:"minecraft:enchanted_golden_apple",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[8].data.entity.Item set value {id:"minecraft:netherite_ingot",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[9].data.entity.Item set from storage stardust:items all.2013003
data modify block ~ ~ ~ SpawnPotentials[10].data.entity.Item set value {id:"minecraft:dragon_egg",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[11].data.entity.Item set from storage stardust:items all.2013005
data modify block ~ ~ ~ SpawnPotentials[12].data.entity.Item set value {id:"minecraft:nether_star",Count:4b}
data modify block ~ ~ ~ SpawnPotentials[13].data.entity.Item set from storage stardust:items all.2013228
data modify block ~ ~ ~ SpawnPotentials[14].data.entity.Item set from storage stardust:items all.2013006
data modify block ~ ~ ~ SpawnPotentials[15].data.entity.Item set from storage stardust:items all.2013008
data modify block ~ ~ ~ SpawnPotentials[16].data.entity.Item set from storage stardust:items all.2013009
data modify block ~ ~ ~ SpawnPotentials[17].data.entity.Item set from storage stardust:items all.2013010
data modify block ~ ~ ~ SpawnPotentials[18].data.entity.Item set value {id:"minecraft:netherite_block",Count:16b}

summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["StardustFragment_Destroyer","StardustFragment_DestroySpawner","StardustFragment_UltimateSpawner"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013226}}}
particle flame ~ ~ ~ 0.5 0.5 0.5 0.01 1000
kill @s

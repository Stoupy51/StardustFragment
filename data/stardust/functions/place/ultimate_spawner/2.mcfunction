setblock ~ ~ ~ spawner{SpawnCount:1,SpawnPotentials:[{Weight:500,Entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}},{Weight:150,Entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}},{Weight:120,Entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}},{Weight:100,Entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}},{Weight:80,Entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}},{Weight:50,Entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}},{Weight:50,Entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}},{Weight:25,Entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}},{Weight:20,Entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}},{Weight:15,Entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}},{Weight:10,Entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}},{Weight:9,Entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}},{Weight:7,Entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}},{Weight:5,Entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}},{Weight:2,Entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}},{Weight:2,Entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}},{Weight:2,Entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}},{Weight:2,Entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}},{Weight:1,Entity:{id:"minecraft:item",Item:{id:"minecraft:cobblestone",Count:1b}}}]}

data modify block ~ ~ ~ SpawnPotentials[0].Entity.Item set from storage stardust:items 2013000
data modify block ~ ~ ~ SpawnPotentials[0].Entity.Item.Count set value 4b
data modify block ~ ~ ~ SpawnPotentials[1].Entity.Item set value {id:"minecraft:iron_ingot",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[2].Entity.Item set value {id:"minecraft:gold_ingot",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[3].Entity.Item set value {id:"minecraft:iron_ingot",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[4].Entity.Item set value {id:"minecraft:diamond",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[5].Entity.Item set value {id:"minecraft:netherite_scrap",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[6].Entity.Item set from storage stardust:items 2013229
data modify block ~ ~ ~ SpawnPotentials[7].Entity.Item set value {id:"minecraft:enchanted_golden_apple",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[8].Entity.Item set value {id:"minecraft:netherite_ingot",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[9].Entity.Item set from storage stardust:items 2013003
data modify block ~ ~ ~ SpawnPotentials[10].Entity.Item set value {id:"minecraft:dragon_egg",Count:1b}
data modify block ~ ~ ~ SpawnPotentials[11].Entity.Item set from storage stardust:items 2013005
data modify block ~ ~ ~ SpawnPotentials[12].Entity.Item set value {id:"minecraft:nether_star",Count:4b}
data modify block ~ ~ ~ SpawnPotentials[13].Entity.Item set from storage stardust:items 2013228
data modify block ~ ~ ~ SpawnPotentials[14].Entity.Item set from storage stardust:items 2013006
data modify block ~ ~ ~ SpawnPotentials[15].Entity.Item set from storage stardust:items 2013008
data modify block ~ ~ ~ SpawnPotentials[16].Entity.Item set from storage stardust:items 2013009
data modify block ~ ~ ~ SpawnPotentials[17].Entity.Item set from storage stardust:items 2013010
data modify block ~ ~ ~ SpawnPotentials[18].Entity.Item set value {id:"minecraft:netherite_block",Count:16b}

summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_UltimateSpawner"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013226}}}
particle flame ~ ~ ~ 0.5 0.5 0.5 0.01 1000
kill @s

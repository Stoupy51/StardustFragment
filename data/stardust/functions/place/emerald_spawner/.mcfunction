
advancement grant @s only stardust:visible/adventure/emerald_spawner
setblock ~ ~ ~ spawner{SpawnData:{entity:{id:"minecraft:item",Item:{id:"minecraft:emerald",Count:1b}}}}
execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function stardust:place/emerald_spawner/secondary
particle flame ~ ~ ~ 0.5 0.5 0.5 0.01 100


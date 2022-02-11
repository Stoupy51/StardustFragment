setblock ~ ~ ~ spawner{SpawnData:{entity:{id:"minecraft:item",Item:{id:"minecraft:emerald",Count:1b}}}}
summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["global.ignore","global.ignore.kill","smithed.block","StardustFragment_Destroyer","StardustFragment_DestroySpawner","StardustFragment_EmeraldSpawner"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013225}}}
particle flame ~ ~ ~ 0.5 0.5 0.5 0.01 1000
kill @s

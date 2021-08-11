setblock ~ ~ ~ spawner{SpawnData:{id:"minecraft:item",Item:{id:"minecraft:emerald",Count:1b}},SpawnPotentials:[{Entity:{id:"minecraft:item",Item:{id:"minecraft:emerald",Count:1b}}}]}
summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_EmeraldSpawner"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b}
particle flame ~ ~ ~ 0.5 0.5 0.5 0.01 1000
kill @s


setblock ~ ~ ~ spawner{SpawnData:{entity:{id:"minecraft:item",Item:{id:"minecraft:emerald",Count:1b}}}}
function stardust:place/glow_item_frame_0
execute as @e[tag=stardust.set_new] at @s run function stardust:place/emerald_spawner/secondary
particle flame ~ ~ ~ 0.5 0.5 0.5 0.01 100

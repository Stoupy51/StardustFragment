summon marker ~ 0 ~ {Tags:["stardust.chunk_init","stardust.chunk_scan","stardust.chunk_gen","global.ignore","global.ignore.kill"]}
execute as @e[type=marker,tag=stardust.chunk_init] at @s run function stardust:generate/init_2

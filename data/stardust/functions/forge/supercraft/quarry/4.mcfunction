function stardust:supercraft/verif
execute at @e[type=minecraft:item,nbt={Item:{id:"minecraft:emerald_block",Count:8b}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=3}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=5..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:silverfish_spawn_egg",Count:1b,tag:{QuarryLv4:1b,EntityTag:{NoAI:1b,Silent:1,ActiveEffects:[{Id:14,Amplifier:0,Duration:20,ShowParticles:0b}],Tags:["QuarryP","SFegg","QuarryLv4"]},HideFlags:127,display:{Lore:['[{"text":"Vitesse : 4","color":"gray","italic":false}]'],Name:'[{"text":"Quarry","color":"white","italic":false}]'}}}}
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:emerald_block",Count:8b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run playsound block.anvil.use block @a[distance=..25]
execute as @s[scores={SF_SCraft=5..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
kill @s[scores={SF_SCraft=5..}]
scoreboard players reset * x
function stardust:supercraft/verif
execute at @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{6C:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{id:"minecraft:spawner",Count:4b}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{id:"minecraft:emerald_block",Count:64b}},limit=4,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=6}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=5..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:creeper_spawn_egg",Count:1b,tag:{SaE:1b,EntityTag:{id:"minecraft:area_effect_cloud",Age:0,Duration:0,Radius:0f,Tags:["SaE","SFegg"],NoAI:1b,Silent:1,ActiveEffects:[{Id:14,Amplifier:0,Duration:20,ShowParticles:0b}]},HideFlags:127,display:{Lore:['[{"text":"Parfait pour s\'enrichir !","italic":false,"color":"white"}]'],Name:'[{"text":"Spawner à Émeraudes","italic":false,"color":"green"}]'},Enchantments:[{lvl:0,id:"minecraft:protection"}]}}}
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{6C:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:spawner",Count:4b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:emerald_block",Count:64b}},limit=4,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run playsound block.anvil.use block @a[distance=..25]
execute as @s[scores={SF_SCraft=5..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
kill @s[scores={SF_SCraft=5..}]
scoreboard players reset * x
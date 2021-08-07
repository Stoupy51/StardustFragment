function stardust:supercraft/verif
execute at @e[type=item,nbt={Item:{Count:1b,tag:{E:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=item,nbt={Item:{Count:1b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=3}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=5..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:creeper_spawn_egg",Count:1b,tag:{GLe:1b,EntityTag:{id:"minecraft:area_effect_cloud",Age:0,Duration:0,Radius:0f,Tags:["GLe","StarSeed","SFegg"],NoAI:1b,Silent:1,ActiveEffects:[{Id:14,Amplifier:0,Duration:20,ShowParticles:0b}]},HideFlags:127,display:{Lore:['[{"text":"Elle ne se plante seulement","color":"white","italic":false}]','[{"text":"sur des blocs de béton vert clair.","color":"white","italic":false}]'],Name:'[{"text":"Graine Légendaire","color":"green","italic":false}]'}}}}
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{Count:1b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{Count:1b,tag:{E:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run playsound block.anvil.use block @a[distance=..25]
execute as @s[scores={SF_SCraft=5..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
kill @s[scores={SF_SCraft=5..}]
scoreboard players reset * x
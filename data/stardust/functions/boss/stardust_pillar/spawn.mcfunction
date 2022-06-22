
advancement grant @a[distance=..100] only stardust:visible/adventure/stardust_pillar
summon wither ~ ~20 ~ {Passengers:[{id:"minecraft:armor_stand",Tags:["stardust.model","stardust.pillar_tick"],Invisible:1b,Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,Marker:1b,ArmorItems:[{},{},{},{id:"golden_hoe",Count:1b,tag:{CustomModelData:2013000}}]}],CustomName:'{"text":"Stardust Pillar (Shield On)","italic":false,"color":"aqua"}',NoAI:1b,Health:351,Attributes:[{Name:"generic.max_health",Base:351}],Invulnerable:1,Tags:["stardust.stardust_pillar","stardust.stardust_dim","stardust.has_shield","stardust.new_mob"],Team:"stardust.team",ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}]}
execute as @e[type=wither,tag=stardust.new_mob,limit=1] run function stardust:boss/stardust_pillar/setup
execute as @a[distance=..200] at @s run playsound stardust:stardust_pillar_spawn master @s
scoreboard players add #stardust_pillar stardust.data 1

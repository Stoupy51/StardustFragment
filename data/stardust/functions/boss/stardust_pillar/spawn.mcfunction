summon minecraft:wither ~ ~20 ~ {Passengers:[{id:"minecraft:armor_stand",Invisible:1b,Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,Marker:1b,Tags:["SF_StardustPillarTick"]}],CustomName:'{"text":"Stardust Pillar (Shield On)","italic":false,"color":"aqua"}',NoAI:1b,Health:151,Attributes:[{Name:"generic.max_health",Base:151}],Invulnerable:1,Tags:["SF_StardustPillar","SF_StardustDim","SF_ShieldOn","SF_NewMob"],Team:"SF_Stardust"}
scoreboard players set @e[type=wither,tag=SF_NewMob,limit=1] SF_Pillar 150
tag @e[type=wither,tag=SF_NewMob] add SF_Angry
execute in stardust:stardust run tag @e[type=wither,tag=SF_NewMob,distance=0..] remove SF_Angry
tag @e[type=wither,tag=SF_NewMob] remove SF_NewMob
scoreboard players add StardustPillar SF_Data 1

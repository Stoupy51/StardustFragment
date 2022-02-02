summon minecraft:wither ~ ~20 ~ {Passengers:[{id:"minecraft:marker",Tags:["StardustFragment_StardustPillarTick"]}],CustomName:'{"text":"Stardust Pillar (Shield On)","italic":false,"color":"aqua"}',NoAI:1b,Health:151,Attributes:[{Name:"generic.max_health",Base:151}],Invulnerable:1,Tags:["StardustFragment_StardustPillar","StardustFragment_StardustDim","StardustFragment_ShieldOn","StardustFragment_NewMob"],Team:"StardustFragment_Stardust"}
scoreboard players set @e[type=wither,tag=StardustFragment_NewMob,limit=1] StardustFragment_Pillar 150
tag @e[type=wither,tag=StardustFragment_NewMob] add StardustFragment_Angry
execute in stardust:stardust run tag @e[type=wither,tag=StardustFragment_NewMob,distance=0..] remove StardustFragment_Angry
tag @e[type=wither,tag=StardustFragment_NewMob] remove StardustFragment_NewMob
scoreboard players add StardustPillar StardustFragment_Data 1

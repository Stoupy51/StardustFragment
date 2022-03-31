
summon wither ~ ~20 ~ {Passengers:[{id:"minecraft:marker",Tags:["stardust.pillar_tick"]}],CustomName:'{"text":"Stardust Pillar (Shield On)","italic":false,"color":"aqua"}',NoAI:1b,Health:151,Attributes:[{Name:"generic.max_health",Base:151}],Invulnerable:1,Tags:["stardust.stardust_pillar","stardust.stardust_dim","stardust.has_shield","stardust.new_mob"],Team:"stardust.team"}
scoreboard players set @e[type=wither,tag=stardust.new_mob,limit=1] stardust.pillar 150
tag @e[type=wither,tag=stardust.new_mob] add stardust.angry
execute in stardust:stardust run tag @e[type=wither,tag=stardust.new_mob,distance=0..] remove stardust.angry
tag @e[type=wither,tag=stardust.new_mob] remove stardust.new_mob
scoreboard players add #stardust_pillar stardust.data 1

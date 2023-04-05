
#> stardust:mobs/stardust_pillar
#
# @within			stardust:boss/stardust_pillar/spawn
# @executed			as & at the player executing the command / summoning the stardust pillar
#
# @description		Spawns a Stardust Pillar runs the setup function
#

# Summon the stardust pillar base mob and run the setup function
summon wither ~ ~ ~ {Passengers:[{id:"minecraft:item_display"}],CustomName:'{"text":"Stardust Pillar (Shield On)","italic":false,"color":"aqua"}',NoAI:1b,Health:351,Attributes:[{Name:"generic.max_health",Base:351}],Invulnerable:1,Tags:["stardust.stardust_pillar","stardust.stardust_mob","stardust.has_shield","stardust.new"],Team:"stardust.team",ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}]}
execute as @e[type=wither,tag=stardust.new,limit=1] on passengers run function stardust:boss/stardust_pillar/setup

# Increment Stardust Pillar count
scoreboard players add #stardust_pillar stardust.data 1


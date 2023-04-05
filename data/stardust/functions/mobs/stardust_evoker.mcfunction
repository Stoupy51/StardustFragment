
#> stardust:mobs/stardust_evoker
#
# @within			stardust:mobs/stardust
# @executed			usually default context
#
# @description		Summon a Stardust Evoker with the given model
#

summon evoker ~ ~ ~ {Passengers:[{id:"minecraft:item_display"}],DeathLootTable:"stardust:entities/stardust_dimension",Health:50.0f,Attributes:[{Name:"generic.max_health",Base:40d},{Name:"generic.attack_damage",Base:5d},{Name:"generic.movement_speed",Base:0.32d}],Tags:["stardust.stardust_mob","stardust.to_throw","stardust.new"],Team:"stardust.team",ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}],Paper.SpawnReason:"NATURAL"}
execute as @e[type=evoker,tag=stardust.new,limit=1] on passengers run function stardust:mobs/item_display/stardust_evoker


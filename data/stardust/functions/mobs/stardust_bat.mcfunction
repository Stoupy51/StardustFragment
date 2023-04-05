
#> stardust:mobs/stardust_bat
#
# @within			stardust:mobs/stardust
# @executed			usually default context
#
# @description		Summon a Stardust Bat with the given model
#

summon bat ~ ~ ~ {Passengers:[{id:"minecraft:item_display"}],DeathLootTable:"stardust:entities/stardust_bat",Health:1.0f,Attributes:[{Name:"generic.max_health",Base:1d}],Tags:["stardust.stardust_mob","stardust.stardust_bat","stardust.new"],Team:"stardust.team",ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}],Paper.SpawnReason:"NATURAL"}
execute as @e[type=bat,tag=stardust.new,limit=1] on passengers run function stardust:mobs/item_display/stardust_bat


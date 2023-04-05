
#> stardust:boss/ultimate_boss/orb/entity
#
# @within			stardust:boss/ultimate_boss/orb/random_pos
# @executed			in stardust:ultimate at a valid random position
#
# @description		Spawns the orb entity at the given position
#

summon iron_golem ~ ~ ~ {Passengers:[{id:"minecraft:item_display"}],Silent:1b,NoAI:1b,Health:1,Attributes:[{Name:"generic.max_health",Base:1}],DeathLootTable:"none",Team:"stardust.team",Tags:["stardust.new","stardust.ultimate_orb"],ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}]}
execute as @e[type=iron_golem,tag=stardust.new,limit=1] run function stardust:boss/ultimate_boss/orb/item_display



summon bat ~ ~ ~ {Passengers:[{id:"minecraft:armor_stand",Tags:["stardust.stardust_dim","stardust.stardust_bat","stardust.new"],Invisible:1b,Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,Marker:1b,Small:1b,ArmorItems:[{},{},{},{id:"golden_hoe",Count:1b,tag:{CustomModelData:2013015}}]}],DeathLootTable:"stardust:entities/stardust_bat",Health:1,Attributes:[{Name:"generic.max_health",Base:1d}],Tags:["stardust.stardust_dim","stardust.stardust_bat","stardust.new"],Team:"stardust.team",ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}]}
execute as @e[type=#stardust:mobs,tag=stardust.new] run function stardust:mobs/next_id
scoreboard players add #next_mob stardust.id 1

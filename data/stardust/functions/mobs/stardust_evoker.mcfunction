
summon evoker ~ ~ ~ {Passengers:[{id:"minecraft:armor_stand",Tags:["global.ignore","global.ignore.kill","smithed.entity","smithed.strict","stardust.model","stardust.stardust_mob","stardust.stardust_evoker","stardust.new"],Invisible:1b,NoBasePlate:1b,NoGravity:1b,Marker:1b,ArmorItems:[{},{},{},{id:"golden_hoe",Count:1b,tag:{CustomModelData:2013010}}]}],DeathLootTable:"stardust:entities/stardust_dimension",Health:50,Attributes:[{Name:"generic.max_health",Base:40d},{Name:"generic.attack_damage",Base:5d},{Name:"generic.movement_speed",Base:0.32d}],Tags:["stardust.stardust_mob","stardust.to_throw","stardust.new"],Team:"stardust.team",ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}],Paper.SpawnReason:"NATURAL"}
execute as @e[type=#stardust:mobs,tag=stardust.new] run function stardust:mobs/next_id
scoreboard players add #next_mob stardust.id 1

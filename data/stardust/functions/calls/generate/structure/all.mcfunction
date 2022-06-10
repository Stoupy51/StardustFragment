
execute store result score #rotation stardust.data run data get entity @s UUID[1]
scoreboard players operation #rotation stardust.data %= #4 simplenergy.data
#Choose which structure
	execute if entity @s[tag=stardust.flying_saucer] if predicate stardust:in_dim/stardust run function stardust:calls/generate/structure/flying_saucer
	execute if entity @s[tag=stardust.water_well] if block ~ ~ ~ #minecraft:dirt run function stardust:calls/generate/structure/water_well
	execute if entity @s[tag=stardust.ach] run function stardust:calls/generate/structure/abandonned_cave_house

kill @s

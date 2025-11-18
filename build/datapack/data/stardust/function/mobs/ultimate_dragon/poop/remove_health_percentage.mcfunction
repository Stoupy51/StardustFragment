
#> stardust:mobs/ultimate_dragon/poop/remove_health_percentage
#
# @executed	as @e[tag=stardust.ultimate_boss] & at @s
#
# @within	stardust:mobs/ultimate_dragon/poop/destroy [ as @e[tag=stardust.ultimate_boss] & at @s ]
#

# Remove 1% of total health (only if above 0 health)
execute store result score #to_remove stardust.data run attribute @s minecraft:max_health get 10
execute store result score #current_health stardust.data run data get entity @s Health 1000
scoreboard players operation #current_health stardust.data -= #to_remove stardust.data
execute if score #current_health stardust.data matches 1.. store result entity @s Health float 0.001 run scoreboard players get #current_health stardust.data

# Particles
particle block{block_state:"redstone_wire"} ~ ~ ~ 3 3 3 0 1000 force @a[distance=..200]



#> stardust:mobs/ultimate_dragon/ultimate_poop/destroy
#
# @executed	as @a[gamemode=!spectator,distance=..2] & at @s
#
# @within	stardust:mobs/ultimate_dragon/ultimate_poop/check_destroy [ as @a[gamemode=!spectator,distance=..2] & at @s ]
#			stardust:mobs/ultimate_dragon/ultimate_poop/check_destroy [ as @e[type=arrow,distance=..2] & at @s ]
#

# Mark success
scoreboard players set #success stardust.data 1

# Playsound for the player who destroyed the poop
execute if entity @s[type=player] run playsound minecraft:entity.ender_dragon.hurt hostile @s
execute if entity @s[type=player] run playsound minecraft:block.honey_block.break ambient @s
execute if entity @s[type=arrow] on origin at @s run playsound minecraft:entity.ender_dragon.hurt hostile @s
execute if entity @s[type=arrow] on origin at @s run playsound minecraft:block.honey_block.break ambient @s
execute if entity @s[type=arrow] run kill @s

# Remove health percentage from all dragons
execute as @e[tag=stardust.dragon] at @s run function stardust:mobs/ultimate_dragon/ultimate_poop/remove_health_percentage


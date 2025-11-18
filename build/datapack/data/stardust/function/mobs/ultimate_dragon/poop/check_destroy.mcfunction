
#> stardust:mobs/ultimate_dragon/poop/check_destroy
#
# @executed	as @e[type=item_display,tag=stardust.ultimate_poop] & at @s
#
# @within	stardust:mobs/ultimate_dragon/tick [ as @e[type=item_display,tag=stardust.ultimate_poop] & at @s ]
#

# If item_display has existed for more than 300 ticks (15 seconds), kill it
scoreboard players add @s stardust.data 1
execute if score @s stardust.data matches 250 run data merge entity @s {transformation:{scale:[0.0d,0.0d,0.0d]},interpolation_duration:20,start_interpolation:0}
execute if score @s stardust.data matches 300.. run return run kill @s

# If a player or an arrow is within 1 block, the poop is destroyed
scoreboard players set #success stardust.data 0
execute as @a[gamemode=!spectator,distance=..2] at @s run function stardust:mobs/ultimate_dragon/poop/destroy
execute as @e[type=arrow,distance=..2] at @s run function stardust:mobs/ultimate_dragon/poop/destroy
execute if score #success stardust.data matches 1.. run kill @s


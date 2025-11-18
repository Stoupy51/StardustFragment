
#> stardust:mobs/ultimate_dragon/common/choose_attack
#
# @executed	as @e[tag=stardust.ultimate_boss,predicate=stardust:random/0.2] & at @s
#
# @within	stardust:mobs/ultimate_dragon/second [ as @e[tag=stardust.ultimate_boss,predicate=stardust:random/0.2] & at @s ]
#

# Choose a random attack and run function
execute store result score @s stardust.chosen_attack run random value 1..2
execute if score @s stardust.chosen_attack matches 1 run return run function stardust:mobs/ultimate_dragon/ultimate_poop/choose
execute if score @s stardust.chosen_attack matches 2 run return run function stardust:mobs/ultimate_dragon/fireball_burst/choose


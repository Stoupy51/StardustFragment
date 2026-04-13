
#> stardust:mobs/ultimate_dragon/fireball_burst/tick
#
# @executed	as @e[tag=stardust.dragon,scores={stardust.attack_cooldown=-200..}] & at @s
#
# @within	stardust:mobs/ultimate_dragon/common/handle_attack_cooldown
#

# Every 3 ticks, launch a fireball
scoreboard players set #3 stardust.data 3
scoreboard players operation #temp stardust.data = #global_tick stardust.data
scoreboard players operation #temp stardust.data %= #3 stardust.data
execute if score #temp stardust.data matches 0 run function stardust:mobs/ultimate_dragon/fireball_burst/launch


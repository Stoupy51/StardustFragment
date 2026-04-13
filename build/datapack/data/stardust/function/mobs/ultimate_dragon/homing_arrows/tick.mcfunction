
#> stardust:mobs/ultimate_dragon/homing_arrows/tick
#
# @executed	as @e[tag=stardust.dragon,scores={stardust.attack_cooldown=-200..}] & at @s
#
# @within	stardust:mobs/ultimate_dragon/common/handle_attack_cooldown
#

# Every 16 ticks, launch all 5 arrows at once
scoreboard players set #16 stardust.data 16
scoreboard players operation #temp stardust.data = #global_tick stardust.data
scoreboard players operation #temp stardust.data %= #16 stardust.data
execute if score #temp stardust.data matches 0 run function stardust:mobs/ultimate_dragon/homing_arrows/launch



#> stardust:mobs/ultimate_dragon/ultimate_poop/choose
#
# @executed	as @e[tag=stardust.ultimate_boss,predicate=stardust:random/0.2] & at @s
#
# @within	stardust:mobs/ultimate_dragon/common/choose_attack
#

# Poop particles for 2 seconds
scoreboard players set @s stardust.attack_cooldown 40

# 20% chance of summoning an ultimate poop directly
execute if predicate stardust:random/0.2 summon item_display run function stardust:mobs/ultimate_dragon/poop/on_new_poop


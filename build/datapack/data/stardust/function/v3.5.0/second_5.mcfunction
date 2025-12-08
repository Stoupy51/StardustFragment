
#> stardust:v3.5.0/second_5
#
# @within	stardust:v3.5.0/tick
#

# Reset timer
scoreboard players set #second_5 stardust.data -10

# Apply Legendarium full armor effect
effect give @a[tag=stardust.legendarium_full_armor] minecraft:jump_boost 6 2 true

# Apply Solarium full armor effect
effect give @a[tag=stardust.solarium_full_armor] minecraft:fire_resistance 6 0 true

# Apply Darkium full armor effect
effect give @a[tag=stardust.darkium_full_armor] minecraft:resistance 6 0 true

# 5 seconds break detection (item display only)
execute if score #total_custom_blocks stardust.data matches 1.. as @e[type=item_display,tag=stardust.custom_block,predicate=!stardust:advanced_check_vanilla_blocks] at @s run function stardust:custom_blocks/destroy

# 5 seconds growing seed break detection (below block check)
execute if score #total_growing_seeds stardust.data matches 1.. as @e[type=#stardust:custom_blocks,tag=stardust.growing_seed] at @s run function stardust:custom_blocks/destroy_growing_seeds

# Energy Balancing system (balance every device having at least 20 kJ)
execute as @e[tag=stardust.can_balance,scores={energy.storage=20..}] at @s[tag=!stardust.balanced] run function stardust:balancing/main
tag @e[tag=stardust.balanced] remove stardust.balanced

# Always drop dragon egg on death
execute unless score #dragon_in_end stardust.data matches 1.. in minecraft:the_end if entity @e[type=minecraft:ender_dragon,x=0,y=0,z=0,distance=..320,nbt={Brain:{}}] run function stardust:utils/dragon_egg_on_death/has_dragon

# Custom blocks second_5 functions
execute if score #second_5_entities stardust.data matches 1.. as @e[tag=stardust.second_5] at @s run function stardust:custom_blocks/second_5


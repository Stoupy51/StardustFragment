
#> stardust:mobs/ultimate_dragon/essence/check_landing
#
# @within	stardust:mobs/ultimate_dragon/essence/on_new_lingering_potion 1t append [ scheduled ]
#			stardust:mobs/ultimate_dragon/essence/check_landing 1t replace [ scheduled ]
#

# Check if lingering potion has landed (no vehicle)
scoreboard players set #remaining_potions stardust.data 0
execute as @e[tag=stardust.check_ultimate_dragon_essence] at @s run function stardust:mobs/ultimate_dragon/essence/check_single_landing

# If any remaining potions, reschedule check
execute if score #remaining_potions stardust.data matches 1.. run schedule function stardust:mobs/ultimate_dragon/essence/check_landing 1t replace


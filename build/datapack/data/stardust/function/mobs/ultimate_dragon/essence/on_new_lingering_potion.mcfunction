
#> stardust:mobs/ultimate_dragon/essence/on_new_lingering_potion
#
# @executed	as @e[type=minecraft:lingering_potion,tag=!stardust.potion_checked]
#
# @within	stardust:advancements/used_lingering_potion [ as @e[type=minecraft:lingering_potion,tag=!stardust.potion_checked] ]
#

# Add checked tag
tag @s add stardust.potion_checked

# Add a passenger item_display to track when it lands
tag @s add stardust.temp
execute summon item_display run function stardust:mobs/ultimate_dragon/essence/add_passenger
tag @s remove stardust.temp

# Start a schedule to check when it lands
schedule function stardust:mobs/ultimate_dragon/essence/check_landing 1t append


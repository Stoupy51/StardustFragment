
#> stardust:advancements/used_lingering_potion
#
# @executed	as the player & at current position
#
# @within	advancement stardust:technical/used_lingering_potion
#

# Revoke advancement
advancement revoke @s only stardust:technical/used_lingering_potion
scoreboard players reset @s stardust.lingering_potion

# Run summon essence function
execute as @e[type=minecraft:lingering_potion,tag=!stardust.potion_checked] if data entity @s Item.components."minecraft:custom_data".stardust.ultimate_dragon_essence run function stardust:mobs/ultimate_dragon/essence/on_new_lingering_potion


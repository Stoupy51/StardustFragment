
#> stardust:mobs/ultimate_dragon/essence/has_landed
#
# @executed	as @e[tag=stardust.check_ultimate_dragon_essence] & at @s
#
# @within	stardust:mobs/ultimate_dragon/essence/check_single_landing
#

# Playsound
playsound minecraft:block.amethyst_block.break ambient @a[distance=..20]

# If not in ultimate dimension,
execute unless dimension stardust:ultimate run return run function stardust:mobs/ultimate_dragon/essence/not_in_ultimate_dimension

# Switch tags
tag @s remove stardust.check_ultimate_dragon_essence
tag @s add stardust.ultimate_dragon_essence_landed

# Start animation (ultimate dragon egg growing)
tp @s ~ ~15 ~
loot replace entity @s contents loot stardust:i/ultimate_dragon_egg
data modify entity @s transformation.scale set value [15.0d,15.0d,15.0d]
data modify entity @s transformation.translation[1] set value 0.0d
data modify entity @s start_interpolation set value 0

# Schedule check for max size reached
scoreboard players set @s stardust.spawn_delay 160
scoreboard players operation @s stardust.spawn_delay += #global_tick stardust.data
schedule function stardust:mobs/ultimate_dragon/essence/animation_loop 1t append


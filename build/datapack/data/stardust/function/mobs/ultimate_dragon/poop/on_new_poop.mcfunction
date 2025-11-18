
#> stardust:mobs/ultimate_dragon/poop/on_new_poop
#
# @executed	as @e[tag=stardust.ultimate_boss,predicate=stardust:random/0.2] & at @s
#
# @within	stardust:mobs/ultimate_dragon/ultimate_poop/choose
#

# Add tags
tag @s add smithed.entity
tag @s add global.ignore
tag @s add smithed.strict
tag @s add global.ignore.kill
tag @s add stardust.ultimate_poop

# Set item display properties
data modify entity @s Glowing set value true
data modify entity @s transformation.scale set value [1.5d,1.5d,1.5d]
loot replace entity @s contents loot stardust:i/ultimate_poop


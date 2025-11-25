
#> stardust:utils/dragon_egg_on_death/has_dragon
#
# @executed	in minecraft:the_end
#
# @within	stardust:v3.5.0/second_5 [ in minecraft:the_end ]
#

# We know there is a dragon, set the flag
scoreboard players set #dragon_in_end stardust.data 1

# Start monitoring dragon's death
schedule function stardust:utils/dragon_egg_on_death/monitor 1s append


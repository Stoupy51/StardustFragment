
#> stardust:utils/dragon_egg_on_death/schedule_place_egg
#
# @executed	in minecraft:the_end
#
# @within	stardust:utils/dragon_egg_on_death/monitor [ in minecraft:the_end ]
#

# Schedule dragon egg drop after 10 seconds (to ensure dragon death sequence is over)
schedule function stardust:utils/dragon_egg_on_death/place_egg_start 10s append
scoreboard players reset #dragon_in_end stardust.data


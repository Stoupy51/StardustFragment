
#> stardust:utils/dragon_egg_on_death/place_egg_start
#
# @within	stardust:utils/dragon_egg_on_death/schedule_place_egg 10s append [ scheduled ]
#

# Drop dragon egg at center of the end
execute in minecraft:the_end positioned 0 100 0 run function stardust:utils/dragon_egg_on_death/place_egg_loop


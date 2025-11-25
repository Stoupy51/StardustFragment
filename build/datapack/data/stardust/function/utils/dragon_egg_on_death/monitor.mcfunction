
#> stardust:utils/dragon_egg_on_death/monitor
#
# @within	stardust:utils/dragon_egg_on_death/has_dragon 1s append [ scheduled ]
#			stardust:utils/dragon_egg_on_death/monitor 1s replace [ scheduled ]
#

# Check if dragon is dead
execute in minecraft:the_end unless entity @e[type=minecraft:ender_dragon,x=0,y=0,z=0,distance=..320,nbt={Brain:{}}] run function stardust:utils/dragon_egg_on_death/schedule_place_egg

# Reschedule check
execute if score #dragon_in_end stardust.data matches 1.. run schedule function stardust:utils/dragon_egg_on_death/monitor 1s replace


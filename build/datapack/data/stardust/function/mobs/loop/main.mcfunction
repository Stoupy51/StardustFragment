
#> stardust:mobs/loop/main
#
# @executed	as @e[type=item_display,tag=...] & at @s
#
# @within	stardust:mobs/ticking [ as @e[type=item_display,tag=...] & at @s ]
#

# Always run display update first
function stardust:mobs/loop/display

# Then run mob-specific behavior unless dying
execute if score #second stardust.data matches 0 unless entity @s[tag=stardust.dying_model] on vehicle at @s run function stardust:mobs/loop/mob_second


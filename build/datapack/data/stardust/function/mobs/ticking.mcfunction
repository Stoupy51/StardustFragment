
#> stardust:mobs/ticking
#
# @within	stardust:v4.0.0/second
#			stardust:mobs/fast_ticking
#

execute as @e[type=item_display,tag=stardust.mob_model,tag=!stardust.dying_model] at @s run function stardust:mobs/loop/main

